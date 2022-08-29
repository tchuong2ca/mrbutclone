
import 'package:mrbutclone/model/courseList/courseData.dart';

import '../mess.dart';

class CourseResponse{
  CourseData? courseData;
  Mess? mess;

  CourseResponse({this.courseData, this.mess});

  CourseResponse.fromJson(Map<String, dynamic> json) {
    this.courseData = json["data"];
    this.mess = json["mess"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> listData = new Map<String, dynamic>();
    listData["data"] = this.courseData;
    listData["mess"] = this.mess;
    return listData;
  }
}