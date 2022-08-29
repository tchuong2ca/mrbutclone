import 'package:mrbutclone/model/class/classListData.dart';
class ClassData {
  List<ClassListData>? onlineclasslistdata;
  int? count;
  String? error;
  ClassData({this.onlineclasslistdata, this.count});
  ClassData.withError(String errorMessage) {
    error = errorMessage;
  }
  ClassData.fromJson(Map<String, dynamic> json) {
    this.onlineclasslistdata = json["listData"]==null ? null : (json["listData"] as List).map((e)=>ClassListData.fromJson(e)).toList();
    this.count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.onlineclasslistdata != null)
      data["listData"] = this.onlineclasslistdata?.map((e)=>e.toJson()).toList();
    data["count"] = this.count;
    return data;
  }
}