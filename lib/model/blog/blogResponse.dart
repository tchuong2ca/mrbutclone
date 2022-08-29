import 'package:mrbutclone/model/blog/blogData.dart';

import '../mess.dart';

class BlogResponse{
  BlogData? blogData;
  Mess? mess;

  BlogResponse({this.blogData, this.mess});

  BlogResponse.fromJson(Map<String, dynamic> json) {
    this.blogData = json["data"];
    this.mess = json["mess"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> listData = new Map<String, dynamic>();
    listData["data"] = this.blogData;
    listData["mess"] = this.mess;
    return listData;
  }
}