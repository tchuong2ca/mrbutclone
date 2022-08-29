import 'package:mrbutclone/model/data.dart';
import 'package:mrbutclone/model/mess.dart';

class CourseResponse{
  Data? data;
  Mess? mess;

  CourseResponse({this.data, this.mess});

  CourseResponse.fromJson(Map<String, dynamic> json) {
    this.data = json["data"];
    this.mess = json["mess"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> listData = new Map<String, dynamic>();
    listData["data"] = this.data;
    listData["mess"] = this.mess;
    return listData;
  }
}