import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:force_touches_taskapp/Helpers/shared.dart';

class CommonAppBarWidget {
  static Widget appBar({String title, double width, double height}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: Text(title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold)),
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Shared.mainColor),
          onPressed: null),
      actions: [
        IconButton(
            icon: Icon(FontAwesome.location, color: Shared.mainColor),
            onPressed: null)
      ],
      bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Divider(),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'مثال: سماعة طبية',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search)),
                ),
                Divider(),
              ],
            ),
          ),
          preferredSize: Size(width, height)),
    );
  }
}
