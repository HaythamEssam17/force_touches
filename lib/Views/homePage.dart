import 'package:flutter/material.dart';
import 'package:force_touches_taskapp/Widgets/commonAppBarWidget.dart';

import 'tabBarListHomePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CommonAppBarWidget.appBar(
            title: 'نتائج البحث',
            width: size.width,
            height: size.height * 0.15),
        body: Container(
          color: Colors.white,
          height: size.height,
          width: size.width,
          // child: TabBarHomePage(),
          child: TabBarListHomePage(),
        ),
      ),
    );
  }
}
