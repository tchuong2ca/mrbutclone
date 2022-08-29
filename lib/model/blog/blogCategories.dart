class BlogCategories {
  String? id;
  String? blogId;
  String? categoryId;
  String? category;

  BlogCategories({this.id, this.blogId, this.categoryId, this.category});

  BlogCategories.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.blogId = json["blogId"];
    this.categoryId = json["categoryId"];
    this.category = json["category"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["blogId"] = this.blogId;
    data["categoryId"] = this.categoryId;
    data["category"] = this.category;
    return data;
  }
}