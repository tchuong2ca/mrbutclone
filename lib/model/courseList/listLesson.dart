import 'listPart.dart';

class ListLesson {
  String? lessonId;
  String? chapterId;
  String? name;
  bool? free;
  int? sortorder;
  String? openType;
  double? openAfter;
  String? completeType;
  int? minView;
  String? createDate;
  String? createUser;
  String? updateDate;
  String? updateUser;
  List<ListPart>? listPart;
  bool? competeLesson;
  int? lessonFirstRow;
  int? lessonLastRow;

  ListLesson({this.lessonId, this.chapterId, this.name, this.free, this.sortorder, this.openType, this.openAfter, this.completeType, this.minView, this.createDate, this.createUser, this.updateDate, this.updateUser, this.listPart, this.competeLesson, this.lessonFirstRow, this.lessonLastRow});

  ListLesson.fromJson(Map<String, dynamic> json) {
    this.lessonId = json["lessonId"];
    this.chapterId = json["chapterId"];
    this.name = json["name"];
    this.free = json["free"];
    this.sortorder = json["sortorder"];
    this.openType = json["openType"];
    this.openAfter = json["openAfter"];
    this.completeType = json["completeType"];
    this.minView = json["minView"];
    this.createDate = json["createDate"];
    this.createUser = json["createUser"];
    this.updateDate = json["updateDate"];
    this.updateUser = json["updateUser"];
    this.listPart = json["listPart"]==null ? null : (json["listPart"] as List).map((e)=>ListPart.fromJson(e)).toList();
    this.competeLesson = json["competeLesson"];
    this.lessonFirstRow = json["lessonFirstRow"];
    this.lessonLastRow = json["lessonLastRow"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["lessonId"] = this.lessonId;
    data["chapterId"] = this.chapterId;
    data["name"] = this.name;
    data["free"] = this.free;
    data["sortorder"] = this.sortorder;
    data["openType"] = this.openType;
    data["openAfter"] = this.openAfter;
    data["completeType"] = this.completeType;
    data["minView"] = this.minView;
    data["createDate"] = this.createDate;
    data["createUser"] = this.createUser;
    data["updateDate"] = this.updateDate;
    data["updateUser"] = this.updateUser;
    if(this.listPart != null)
      data["listPart"] = this.listPart?.map((e)=>e.toJson()).toList();
    data["competeLesson"] = this.competeLesson;
    data["lessonFirstRow"] = this.lessonFirstRow;
    data["lessonLastRow"] = this.lessonLastRow;
    return data;
  }
}