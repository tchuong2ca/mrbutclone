import 'package:mrbutclone/model/mess.dart';
import 'package:mrbutclone/model/teacher/teacherData.dart';

class TeacherResponse{
  TeacherData? teacherData;
  Mess? mess;

  TeacherResponse({this.teacherData, this.mess});

  TeacherResponse.fromJson(Map<String, dynamic> json) {
    this.teacherData = json["data"];
    this.mess = json["mess"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> listData = new Map<String, dynamic>();
    listData["data"] = this.teacherData;
    listData["mess"] = this.mess;
    return listData;
  }
}