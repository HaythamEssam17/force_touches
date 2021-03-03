class SubCategoryModel {
  int id;
  String title;
  int categoryID;

  SubCategoryModel({this.id, this.title, this.categoryID});

  static List<SubCategoryModel> list = [
    SubCategoryModel(id: 1, title: 'فيتامينات', categoryID: 1),
    SubCategoryModel(id: 2, title: 'مسكنات', categoryID: 1),
    SubCategoryModel(id: 3, title: 'أدوية', categoryID: 1),
    SubCategoryModel(id: 4, title: 'بنوك مصرية', categoryID: 4),
    SubCategoryModel(id: 5, title: 'بنوك أجنبية', categoryID: 4),
  ];
}
