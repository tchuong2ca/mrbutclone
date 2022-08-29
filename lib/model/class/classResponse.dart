import 'package:mrbutclone/model/mess.dart';
import 'package:mrbutclone/model/class/classData.dart';

import 'classData.dart';

class ClassResponse{
  ClassData? classData;
  Mess? mess;

  ClassResponse({this.classData, this.mess});

  ClassResponse.fromJson(Map<String, dynamic> json) {
    this.classData = json["data"];
    this.mess = json["mess"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> listData = new Map<String, dynamic>();
    listData["data"] = this.classData;
    listData["mess"] = this.mess;
    return listData;
  }
}