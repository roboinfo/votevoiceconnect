import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:votevoiceconnect/Gscheme/user_model.dart';
import 'package:votevoiceconnect/apiServices/constants.dart';
import 'package:votevoiceconnect/Blog/user_model.dart';
import 'package:votevoiceconnect/article/user_model.dart';
import 'package:votevoiceconnect/event/user_model.dart';
import 'package:votevoiceconnect/page/gallery/user_model.dart';


class ApiServiceBlog {
  Future<List<Blog>?> getBlog() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Blog> model = blogFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}


class ApiServiceArticle {
  Future<List<Article>?> getArticle() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint1);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Article> model = articleFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class ApiServiceEvent {
  Future<List<Event>?> getEvent() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint2);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Event> model = eventFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class ApiServiceScheme {
  Future<List<Scheme>?> getScheme() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint3);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Scheme> model = schemeFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class ApiServiceGallery {
  Future<List<Gallery>?> getGallery() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint4);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Gallery> model = galleryFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

