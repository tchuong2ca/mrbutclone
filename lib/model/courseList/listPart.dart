
class ListPart {
  String? partId;
  String? lessonId;
  String? title;
  String? partType;
  int? partFirstRow;
  int? partLastRow;

  ListPart({this.partId, this.lessonId, this.title, this.partType, this.partFirstRow, this.partLastRow});

  ListPart.fromJson(Map<String, dynamic> json) {
    this.partId = json["partId"];
    this.lessonId = json["lessonId"];
    this.title = json["title"];
    this.partType = json["partType"];
    this.partFirstRow = json["partFirstRow"];
    this.partLastRow = json["partLastRow"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["partId"] = this.partId;
    data["lessonId"] = this.lessonId;
    data["title"] = this.title;
    data["partType"] = this.partType;
    data["partFirstRow"] = this.partFirstRow;
    data["partLastRow"] = this.partLastRow;
    return data;
  }
}