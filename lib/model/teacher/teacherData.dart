

import 'package:mrbutclone/model/teacher/teacherListData.dart';

class TeacherData {
  List<TeacherListData>? teacherlistdata;
  int? count;

  TeacherData({this.teacherlistdata, this.count});

  TeacherData.fromJson(Map<String, dynamic> json) {
    this.teacherlistdata = json["listData"]==null ? null : (json["listData"] as List).map((e)=>TeacherListData.fromJson(e)).toList();
    this.count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.teacherlistdata != null)
      data["listData"] = this.teacherlistdata?.map((e)=>e.toJson()).toList();
    data["count"] = this.count;
    return data;
  }
}