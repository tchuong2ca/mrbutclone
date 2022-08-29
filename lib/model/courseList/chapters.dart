
import 'listLesson.dart';

class Chapters {
  String? chapterId;
  String? courseId;
  String? name;
  int? sortorder;
  String? openType;
  double? openAfter;
  String? createDate;
  String? createUser;
  List<ListLesson>? listLesson;
  int? chapterFirstRow;
  int? chapterLastRow;

  Chapters({this.chapterId, this.courseId, this.name, this.sortorder, this.openType, this.openAfter, this.createDate, this.createUser, this.listLesson, this.chapterFirstRow, this.chapterLastRow});

  Chapters.fromJson(Map<String, dynamic> json) {
    this.chapterId = json["chapterId"];
    this.courseId = json["courseId"];
    this.name = json["name"];
    this.sortorder = json["sortorder"];
    this.openType = json["openType"];
    this.openAfter = json["openAfter"];
    this.createDate = json["createDate"];
    this.createUser = json["createUser"];
    this.listLesson = json["listLesson"]==null ? null : (json["listLesson"] as List).map((e)=>ListLesson.fromJson(e)).toList();
    this.chapterFirstRow = json["chapterFirstRow"];
    this.chapterLastRow = json["chapterLastRow"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["chapterId"] = this.chapterId;
    data["courseId"] = this.courseId;
    data["name"] = this.name;
    data["sortorder"] = this.sortorder;
    data["openType"] = this.openType;
    data["openAfter"] = this.openAfter;
    data["createDate"] = this.createDate;
    data["createUser"] = this.createUser;
    if(this.listLesson != null)
      data["listLesson"] = this.listLesson?.map((e)=>e.toJson()).toList();
    data["chapterFirstRow"] = this.chapterFirstRow;
    data["chapterLastRow"] = this.chapterLastRow;
    return data;
  }
}
