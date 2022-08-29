
import 'package:mrbutclone/model/blog/blogCategories.dart';

class BlogData {
  String? blogId;
  String? title;
  String? keyword;
  String? shortContent;
  String? deviceType;
  String? urlImageRepresent;
  String? categoryId;
  String? createDate;
  String? createUser;
  String? updateDate;
  String? updateUser;
  int? sortedDate;
  List<BlogCategories>? blogcategories;

  BlogData({this.blogId, this.title, this.keyword, this.shortContent, this.deviceType, this.urlImageRepresent, this.categoryId, this.createDate, this.createUser, this.updateDate, this.updateUser, this.sortedDate, this.blogcategories});

  BlogData.fromJson(Map<String, dynamic> json) {
    this.blogId = json["blogId"];
    this.title = json["title"];
    this.keyword = json["keyword"];
    this.shortContent = json["shortContent"];
    this.deviceType = json["deviceType"];
    this.urlImageRepresent = json["urlImageRepresent"];
    this.categoryId = json["categoryId"];
    this.createDate = json["createDate"];
    this.createUser = json["createUser"];
    this.updateDate = json["updateDate"];
    this.updateUser = json["updateUser"];
    this.sortedDate = json["sortedDate"];
    this.blogcategories = json["categories"]==null ? null : (json["categories"] as List).map((e)=>BlogCategories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["blogId"] = this.blogId;
    data["title"] = this.title;
    data["keyword"] = this.keyword;
    data["shortContent"] = this.shortContent;
    data["deviceType"] = this.deviceType;
    data["urlImageRepresent"] = this.urlImageRepresent;
    data["categoryId"] = this.categoryId;
    data["createDate"] = this.createDate;
    data["createUser"] = this.createUser;
    data["updateDate"] = this.updateDate;
    data["updateUser"] = this.updateUser;
    data["sortedDate"] = this.sortedDate;
    if(this.blogcategories != null)
      data["categories"] = this.blogcategories?.map((e)=>e.toJson()).toList();
    return data;
  }
}