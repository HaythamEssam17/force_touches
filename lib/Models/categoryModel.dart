import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class CategoryModel {
  int id;
  String title;
  IconData iconData;

  CategoryModel({this.id, this.title, this.iconData});

  static List<CategoryModel> list = [
    CategoryModel(id: 1, title: 'طبية', iconData: FontAwesome.stethoscope),
    CategoryModel(id: 2, title: 'منازل', iconData: FontAwesome.home),
    CategoryModel(id: 3, title: 'مساجد', iconData: FontAwesome5.mosque),
    CategoryModel(id: 4, title: 'بنوك', iconData: FontAwesome.money),
  ];
}
