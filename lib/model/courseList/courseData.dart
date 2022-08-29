
import 'chapters.dart';
import 'courseinfo.dart';

class CourseData {
  List<Chapters>? chapters;
  CourseInfo? courseInfo;

  CourseData({this.chapters, this.courseInfo});

  CourseData.fromJson(Map<String, dynamic> json) {
    this.chapters = json["chapters"]==null ? null : (json["chapters"] as List).map((e)=>Chapters.fromJson(e)).toList();
    this.courseInfo = json["courseInfo"] == null ? null : CourseInfo.fromJson(json["courseInfo"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.chapters != null)
      data["chapters"] = this.chapters?.map((e)=>e.toJson()).toList();
    if(this.courseInfo != null)
      data["courseInfo"] = this.courseInfo?.toJson();
    return data;
  }
}