import 'package:flutter/material.dart';
import 'package:force_touches_taskapp/Models/categoryModel.dart';
import 'package:force_touches_taskapp/Models/productModel.dart';
import 'package:force_touches_taskapp/Widgets/commonCategoryCardWidget.dart';
import 'package:force_touches_taskapp/Widgets/commonProductCardWidget.dart';

import 'categoryCardStatePage.dart';

class TabBarHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabBarHomePageState();
}

class TabBarHomePageState extends State<TabBarHomePage> {
  int selectedIndex = -1;
  CategoryModel _categoryModel;
  List<ProductModel> productsList;

  void setSelectedIndex({int id}) {
    setState(() {
      if (selectedIndex == id) {
        selectedIndex = -1;
        productsList = ProductModel.list;
      } else
        selectedIndex = id;
    });
  }

  @override
  void initState() {
    super.initState();
    productsList = ProductModel.list;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            customTabBar(),
            Expanded(
              child: Container(
                  height: size.height,
                  width: size.width,
                  child: productsList.length == 0
                      ? Center(
                          child: Text('لا توجد منتجات في هذا القسم حالياً'))
                      : ListView.builder(
                          itemBuilder: (context, index) => Container(
                            height: size.height * 0.3,
                            width: size.width,
                            child: CommonProductCardWidget(
                              title: productsList[index].title,
                              count: productsList[index].count,
                              description: productsList[index].description,
                              image: productsList[index].image,
                            ),
                          ),
                          itemCount: productsList.length,
                        )),
            )
          ],
        ),
      ),
    );
  }

  Widget customTabBar() {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      width: size.width,
      child: _categoryModel == null
          ? ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: CategoryModel.list
                  .map(
                    (e) => CategoryCard(
                      selected: selectedIndex == e.id,
                      title: e.title,
                      iconData: e.iconData,
                      onTap: () {
                        setState(() {
                          setSelectedIndex(id: e.id);

                          _categoryModel = e;
                          productsList = ProductModel.list
                              .where((e) => e.id == selectedIndex)
                              .toList();
                        });
                      },
                    ),
                  )
                  .toList(),
            )
          : Container(
              child: Row(
                children: [
                  CategoryCard(
                    selected: selectedIndex == _categoryModel.id,
                    title: _categoryModel.title,
                    iconData: _categoryModel.iconData,
                    onTap: () {
                      setState(() {
                        // setSelectedIndex(_categoryModel.title);
                        setSelectedIndex(id: _categoryModel.id);

                        _categoryModel = _categoryModel;
                        productsList = ProductModel.list
                            .where((e) => e.id == selectedIndex)
                            .toList();
                      });
                    },
                  ),
                  Expanded(
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width,
                      child: CategoryCardStatePage(_categoryModel.title),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
