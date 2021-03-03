import 'package:flutter/material.dart';
import 'package:force_touches_taskapp/Models/categoryModel.dart';
import 'package:force_touches_taskapp/Models/productModel.dart';
import 'package:force_touches_taskapp/Models/subCategoryModel.dart';
import 'package:force_touches_taskapp/Widgets/commonCategoryCardWidget.dart';
import 'package:force_touches_taskapp/Widgets/commonProductCardWidget.dart';

class TabBarListHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabBarListHomePageState();
}

class TabBarListHomePageState extends State<TabBarListHomePage> {
  int selectedCatIndex = -1;
  int selectedSubCatIndex = -1;
  int categoryID;
  CategoryModel _categoryModel;
  List<ProductModel> productsList;
  List<int> catIdList = [];

  void setSelectedIndex(int id, {CategoryModel model}) {
    setState(() {

      if (selectedCatIndex == id) {
        selectedCatIndex = -1;
        productsList = ProductModel.list;
        catIdList.remove(id);
      } else {
        selectedCatIndex = id;
        productsList = ProductModel.list.where((e) => e.catID == id).toList();
        catIdList.add(id);
        categoryID = id;
      }

      _categoryModel = model;
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
            selectedCatIndex == -1
                ? customTabBar()
                : customSubTabBar(categoryID),
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                child: productsList.length == 0
                    ? Center(child: Text('لا توجد منتجات في هذا القسم حالياً'))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            height: size.height * 0.3,
                            width: size.width,
                            child: CommonProductCardWidget(
                              title: productsList[index].title,
                              count: productsList[index].count,
                              description: productsList[index].description,
                              image: productsList[index].image,
                            ),
                          );
                        },
                        itemCount: productsList.length,
                      ),
              ),
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
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: CategoryModel.list
            .map(
              (e) => CategoryCard(
                selected: selectedCatIndex == e.id,
                title: e.title,
                iconData: e.iconData,
                onTap: () {
                  setState(() {
                    setSelectedIndex(e.id, model: e);
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget customSubTabBar(int catID) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      width: size.width,
      color: Colors.white,
      child: Row(
        children: [
          CategoryCard(
            selected: selectedCatIndex == catID,
            // title: _categoryModel.title,
            title: _categoryModel == null ? '' : _categoryModel.title,
            onTap: () {
              setState(() {
                setSelectedIndex(_categoryModel.id);
              });
            },
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: SubCategoryModel.list
                  .where((i) => i.categoryID == _categoryModel.id)
                  .map(
                    (e) => CategoryCard(
                      selected: selectedCatIndex == e.id,
                      title: e.title,
                      onTap: () {
                        setState(() {
                          setSelectedIndex(e.id,
                              model: CategoryModel.list
                                  .firstWhere((i) => i.id == e.categoryID));
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
