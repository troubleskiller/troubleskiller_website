class CategoryModel {
  CategoryModel({
    this.categoryName,
    this.categoryPy,
    this.description,
    this.id,
    this.order,
  });

  CategoryModel.fromJson(dynamic json) {
    categoryName = json['category_name'];
    categoryPy = json['category_py'];
    description = json['description'];
    id = json['id'];
    order = json['order'];
  }

  String? categoryName;
  String? categoryPy;
  String? description;
  int? id;
  int? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_name'] = categoryName;
    map['category_py'] = categoryPy;
    map['description'] = description;
    map['id'] = id;
    map['order'] = order;
    return map;
  }
}

class CategoryJSONModel {
  CategoryJSONModel({
    this.result,
  });

  List<CategoryModel>? result;

  factory CategoryJSONModel.fromJson(List<dynamic> parsedJson) {
    List<CategoryModel> repos =
        parsedJson.map((i) => CategoryModel.fromJson(i)).toList();

    return CategoryJSONModel(
      result: repos,
    );
  }
}
