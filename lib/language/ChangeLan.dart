import 'package:votevoiceconnect/language/LanguageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';


class LanguageMenu extends GetView<LanguageController> {

  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.language,color: Colors.black,),
      offset: Offset(0, 30),
      itemBuilder: (context) =>
          controller.optionslocales.entries.map((e) {
            return PopupMenuItem(
                value: e.key,
                child: Text("${e.value['description']}"));
          }).toList(),
      onSelected: (newvalue) {
        controller.updateLocale(newvalue);
      },
    );
  }
}