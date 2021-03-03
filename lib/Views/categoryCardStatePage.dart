import 'package:flutter/material.dart';
import 'package:force_touches_taskapp/Models/productModel.dart';
import 'package:force_touches_taskapp/Widgets/commonCategoryCardWidget.dart';

class CategoryCardStatePage extends StatefulWidget {
  final String categoryTitle;
  CategoryCardStatePage(this.categoryTitle);

  @override
  State<StatefulWidget> createState() => CategoryCardStatePageState();
}

class CategoryCardStatePageState extends State<CategoryCardStatePage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: Colors.transparent,
        ),
        child: Container(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: ProductModel.list
                .where((i) => '' == widget.categoryTitle)
                .where((i) => i.catTitle == widget.categoryTitle)
                .map((p) => CategoryCard(
                      selected: selectedIndex == p.id,
                      title: p.title,
                      iconData: null,
                      onTap: () {
                        setState(() {
                          setSelectedIndex(p.id);
                        });
                      },
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  void setSelectedIndex(int index) {
    setState(() {
      if (selectedIndex == index) {
        selectedIndex = -1;
        print('selected index: $selectedIndex');
      } else {
        selectedIndex = index;
        print('selected index: $selectedIndex');
      }
    });
  }
}
