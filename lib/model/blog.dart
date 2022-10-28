class Blog {
  int? id;
  int category_id;
  String title;
  String content;
  int type;
  int status;
  DateTime publish_time;

  Blog(this.id, this.category_id, this.title, this.content, this.type,
      this.status, this.publish_time);

  @override
  String toString() {
    return 'Blog{id: $id, category_id: $category_id, title: $title, content: $content, type: $type, status: $status, publish_time: $publish_time}';
  }
}
