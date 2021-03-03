class ProductModel {
  int id;
  String catTitle;
  int catID;
  int subCatID;
  String title;
  String description;
  String image;
  int count;

  ProductModel(
      {this.id,
      this.catTitle,
      this.catID,
      this.subCatID,
      this.title,
      this.image,
      this.count,
      this.description});

  static List<ProductModel> list = [
    ProductModel(
        id: 1,
        catTitle: 'طبية',
        catID: 1,
        subCatID: 1,
        title: 'نيوروتون حقن',
        count: 20,
        image:
            'https://img3.stockfresh.com/files/k/koufax73/m/10/580080_stock-photo-medicals.jpg',
        description: 'نيوروتون حقن نيوروتون حقن نيوروتون حقن'),
    ProductModel(
        id: 2,
        catTitle: 'طبية',
        catID: 1,
        subCatID: 1,
        title: 'كافيجين كبسولات',
        count: 20,
        image: null,
        description: 'كافيجين كبسولات كافيجين كبسولات كافيجين كبسولات'),
    ProductModel(
        id: 3,
        catTitle: 'طبية',
        catID: 1,
        subCatID: 3,
        title: 'كافيجين كبسولات',
        count: 20,
        image:
            'https://keralainformation.com/directory/wp-content/uploads/2016/03/alappathu.jpg',
        description: 'كافيجين كبسولات كافيجين كبسولات كافيجين كبسولات'),
    ProductModel(
        id: 4,
        catTitle: 'بنوك',
        catID: 4,
        subCatID: 5,
        title: 'بنك أبوظبي التجاري',
        count: 20,
        image:
            'https://tokenpost.com/assets/uploads/20190904141fbdb577e02a91f.jpg',
        description:
            'بنك أبوظبي التجاري بنك أبوظبي التجاري بنك أبوظبي التجاري'),
    ProductModel(
        id: 4,
        catTitle: 'بنوك',
        catID: 4,
        subCatID: 6,
        title: 'بنك أبوظبي',
        count: 20,
        image:
            'https://tokenpost.com/assets/uploads/20190904141fbdb577e02a91f.jpg',
        description: 'بنك أبوظبي  بنك أبوظبي  بنك أبوظبي '),
  ];
}
