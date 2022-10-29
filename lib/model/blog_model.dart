import 'dart:convert';

/// category_id : 1
/// content : "这是测试数据的内容"
/// id : 1
/// publish_time : 1666750576000
/// status : 1
/// title : "这是我插入的数据"
/// type : 0

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));
String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
    int? categoryId,
    String? content,
    int? id,
    int? publishTime,
    int? status,
    String? title,
    int? type,
  }) {
    _categoryId = categoryId;
    _content = content;
    _id = id;
    _publishTime = publishTime;
    _status = status;
    _title = title;
    _type = type;
  }

  BlogModel.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _content = json['content'];
    _id = json['id'];
    _publishTime = json['publish_time'];
    _status = json['status'];
    _title = json['title'];
    _type = json['type'];
  }
  int? _categoryId;
  String? _content;
  int? _id;
  int? _publishTime;
  int? _status;
  String? _title;
  int? _type;
  BlogModel copyWith({
    int? categoryId,
    String? content,
    int? id,
    int? publishTime,
    int? status,
    String? title,
    int? type,
  }) =>
      BlogModel(
        categoryId: categoryId ?? _categoryId,
        content: content ?? _content,
        id: id ?? _id,
        publishTime: publishTime ?? _publishTime,
        status: status ?? _status,
        title: title ?? _title,
        type: type ?? _type,
      );
  int? get categoryId => _categoryId;
  String? get content => _content;
  int? get id => _id;
  int? get publishTime => _publishTime;
  int? get status => _status;
  String? get title => _title;
  int? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['content'] = _content;
    map['id'] = _id;
    map['publish_time'] = _publishTime;
    map['status'] = _status;
    map['title'] = _title;
    map['type'] = _type;
    return map;
  }
}
class BlogJSONModel {
  BlogJSONModel({
    this.result,
  });

  List<BlogModel>? result;

  factory BlogJSONModel.fromJson(List<dynamic> parsedJson) {
    List<BlogModel> repos =
    parsedJson.map((i) => BlogModel.fromJson(i)).toList();

    return BlogJSONModel(
      result: repos,
    );
  }
}