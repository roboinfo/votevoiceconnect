import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';



class Event {
  final int id;
  final String title;
  final String details;
  final String location;
  final String date;
  final String time;
  final String categoryId;
  final String featuredImageUrl;

  Event({
    required this.id,
    required this.title,
    required this.details,
    required this.location,
    required this.date,
    required this.time,
    required this.categoryId,
    required this.featuredImageUrl,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      details: json['details'],
      location: json['location'],
      date: json['date'],
      time: json['time'],
      categoryId: json['category_id'],
      featuredImageUrl: json['featured_image_url'],
    );
  }
}

class EventService {
  static const String baseUrl = 'https://myconstituency.in/myconstituency/api';

  Future<List<Event>> getEvents() async {
    final response = await http.get(Uri.parse('$baseUrl/get-all-event-posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<Map<String, dynamic>> createEvent(
      String eventTitle, String eventDetails, String eventLocation, String category, String eventDate, String eventTime,
      [XFile? featuredPhoto]) async {
    final url = '$baseUrl/get-all-event-posts';
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['eventTitle'] = eventTitle;
      request.fields['eventDetails'] = eventDetails;
      request.fields['eventLocation'] = eventLocation;
      request.fields['eventDate'] = eventDate;
      request.fields['eventTime'] = eventTime;
      request.fields['category'] = category.toString();
      if (featuredPhoto != null) {
        final Uint8List fileBytes = await featuredPhoto.readAsBytes();
        final fileName = path.basename(featuredPhoto.path);
        var file = http.MultipartFile.fromBytes(
          'featuredPhoto',
          fileBytes,
          filename: fileName,
        );
        request.files.add(file);
      }
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var parsedResponse = json.decode(responseBody);
      if (response.statusCode == 200) {
        return {'success': true, 'message': parsedResponse['message']};
      } else {
        return {'success': false, 'error': parsedResponse['error']};
      }
    } catch (e) {
      return {'success': false, 'error': 'Failed to connect to the server.'};
    }
  }

  Future<Map<String, dynamic>> updateEvent(
      int eventId, String eventTitle, String eventDetails, String eventLocation, int category,
      [XFile? featuredPhoto]) async {
    final url = '$baseUrl/get-all-event-posts/$eventId'; // Update the endpoint accordingly
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['eventTitle'] = eventTitle;
      request.fields['eventDetails'] = eventDetails;
      request.fields['eventLocation'] = eventLocation;
      request.fields['category'] = category.toString();
      if (featuredPhoto != null) {
        final Uint8List fileBytes = await featuredPhoto.readAsBytes();
        final fileName = path.basename(featuredPhoto.path);
        var file = http.MultipartFile.fromBytes(
          'featuredPhoto',
          fileBytes,
          filename: fileName,
        );
        request.files.add(file);
      }
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var parsedResponse = json.decode(responseBody);
      if (response.statusCode == 200) {
        return {'success': true, 'message': parsedResponse['message']};
      } else {
        return {'success': false, 'error': parsedResponse['error']};
      }
    } catch (e) {
      return {'success': false, 'error': 'Failed to connect to the server.'};
    }
  }

  Future<Map<String, dynamic>> deleteEvent(int eventId) async {
    final url = '$baseUrl/get-all-event-posts/$eventId'; // Update the endpoint accordingly
    try {
      var response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        var parsedResponse = json.decode(response.body);
        return {'success': true, 'message': parsedResponse['message']};
      } else {
        throw Exception('Failed to delete event');
      }
    } catch (e) {
      return {'success': false, 'error': 'Failed to connect to the server.'};
    }
  }
}

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  final EventService eventService = EventService();
  late TextEditingController titleController;
  late TextEditingController detailsController;
  late TextEditingController locationController;
  late TextEditingController dateController;
  late TextEditingController timeController;
  late TextEditingController categoryController;
  int selectedCategory = 1;
  //Category1? _selectedCategory;
  //CategoryService1 _categoryService1 = CategoryService1();
  //final List<Category1> _categoryList = [];
  XFile? _image;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    detailsController = TextEditingController();
    locationController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();
    categoryController = TextEditingController();
    //getAllCategories();
  }

  // getAllCategories() async {
  //   var Categories = await _categoryService1.getCategories1();
  //   var result = json.decode(Categories.body);
  //   result['data'].forEach((data) {
  //     var model = Category1();
  //     model.id = data['id'];
  //     model.name = data['name'];
  //     print(_categoryList);
  //     setState(() {
  //       _categoryList.add(model);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: FutureBuilder<List<Event>>(
        future: eventService.getEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final events = snapshot.data ?? [];
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text(event.details),
                  leading: event.featuredImageUrl.isNotEmpty
                      ? Image.network(event.featuredImageUrl)
                      : null,
                  onTap: () {
                    _showEventOptionsDialog(event);
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddEventDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddEventDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Event'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: detailsController,
                  decoration: InputDecoration(labelText: 'Details'),
                ),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                ),

                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(labelText: 'Category ID'),
                  keyboardType: TextInputType.number,
                ),

                TextField(
                  controller: dateController,
                  //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      //icon of text field
                      labelText: "Event Date" //label text of field
                  ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                      new DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                ),

                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.access_time),
                    labelText: "Event Time",
                  ),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (pickedTime != null) {
                      setState(() {
                        timeController.text = pickedTime.format(context);
                      });
                    }
                  },
                ),

                // DropdownButton<Category1>(
                //   hint: Text('Select State'),
                //   value: _selectedCategory,
                //   // The currently selected category
                //   items: _categoryList.map((category) {
                //     return DropdownMenuItem<Category1>(
                //       value: category,
                //       child: Text(category.name ?? ''),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       _selectedCategory =
                //           value; // Set the selected category
                //     });
                //   },
                //   selectedItemBuilder: (BuildContext context) {
                //     return _categoryList.map<Widget>((category) {
                //       return Text(category.name ?? '');
                //     }).toList();
                //   },
                // ),
                ElevatedButton(
                  onPressed: _getImage,
                  child: Text('Choose Featured Photo'),
                ),
                _image != null
                    ? Image.file(
                  File(_image!.path),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )
                    : SizedBox(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: _createEvent,
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEventOptionsDialog(Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showEditEventDialog(event);
                },
                child: Text('Edit Event'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showDeleteEventDialog(event);
                },
                child: Text('Delete Event'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditEventDialog(Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Event'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController..text = event.title,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: detailsController..text = event.details,
                  decoration: InputDecoration(labelText: 'Details'),
                ),
                TextField(
                  controller: locationController..text = event.location,
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                TextField(
                  controller: categoryController..text = event.categoryId,
                  decoration: InputDecoration(labelText: 'Category ID'),
                  keyboardType: TextInputType.number,
                ),

                // DropdownButton<Category1>(
                //   hint: Text('Select State'),
                //   value: _selectedCategory,
                //   // The currently selected category
                //   items: _categoryList.map((category) {
                //     return DropdownMenuItem<Category1>(
                //       value: category,
                //       child: Text(category.name ?? ''),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       _selectedCategory =
                //           value; // Set the selected category
                //     });
                //   },
                //   selectedItemBuilder: (BuildContext context) {
                //     return _categoryList.map<Widget>((category) {
                //       return Text(category.name ?? '');
                //     }).toList();
                //   },
                // ),
                ElevatedButton(
                  onPressed: _getImage,
                  child: Text('Choose Featured Photo'),
                ),
                _image != null
                    ? Image.file(
                  _image as File,
                  height: 100,
                )
                    : Container(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await _updateEvent(event);
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteEventDialog(Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Event'),
          content: Text('Are you sure you want to delete this event?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await _deleteEvent(event.id);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteEvent(int eventId) async {
    try {
      var result = await eventService.deleteEvent(eventId);
      if (result['success']) {
        print('Event deleted successfully: ${result['message']}');
        // Update the UI or navigate to a different screen as needed
      } else {
        print('Failed to delete event: ${result['error']}');
      }
    } catch (e) {
      print('Failed to delete event: $e');
    }
  }

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  Future<void> _createEvent() async {
    String title = titleController.text;
    String details = detailsController.text;
    String location = locationController.text;
    String categoryId = categoryController.text;
    String date = dateController.text;
    String time = timeController.text;
    var result = await eventService.createEvent(
      title, details, location, date, time, categoryId, _image,
    );
    if (result['success']) {
      print('Event created successfully: ${result['message']}');
    } else {
      print('Failed to create event: ${result['error']}');
    }
  }


  Future<void> _updateEvent(Event event) async {
    try {
      var result = await eventService.updateEvent(
        event.id,
        titleController.text,
        detailsController.text,
        locationController.text,
        selectedCategory,
        _image,
      );

      if (result['success']) {
        print('Event updated successfully: ${result['message']}');
        // Update the UI or navigate to a different screen as needed
      } else {
        print('Failed to update event: ${result['error']}');
      }
    } catch (e) {
      print('Failed to update event: $e');
    }
  }
}


void main() {
  runApp(MaterialApp(
    home: EventListScreen(),
  ));
}


