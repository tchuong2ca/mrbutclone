import 'listData.dart';

class Data {
  List<ListData>? listData;
  int? count;

  Data({this.listData, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    this.listData = json["listData"]==null ? null : (json["listData"] as List).map((e)=>ListData.fromJson(e)).toList();
    this.count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.listData != null)
      data["listData"] = this.listData?.map((e)=>e.toJson()).toList();
    data["count"] = this.count;
    return data;
  }
}