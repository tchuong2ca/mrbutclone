
class CommentData {
  String? courseCommentId;
  dynamic? schoolId;
  String? courseId;
  String? content;
  String? createUser;
  String? createDate;
  String? createUserFullName;
  String? createUserAvatar;
  String? courseName;
  String? courseKeyword;
  String? courseImage;

  CommentData({this.courseCommentId, this.schoolId, this.courseId, this.content, this.createUser, this.createDate, this.createUserFullName, this.createUserAvatar, this.courseName, this.courseKeyword, this.courseImage});

  CommentData.fromJson(Map<String, dynamic> json) {
    this.courseCommentId = json["courseCommentId"];
    this.schoolId = json["schoolId"];
    this.courseId = json["courseId"];
    this.content = json["content"];
    this.createUser = json["createUser"];
    this.createDate = json["createDate"];
    this.createUserFullName = json["createUserFullName"];
    this.createUserAvatar = json["createUserAvatar"];
    this.courseName = json["courseName"];
    this.courseKeyword = json["courseKeyword"];
    this.courseImage = json["courseImage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["courseCommentId"] = this.courseCommentId;
    data["schoolId"] = this.schoolId;
    data["courseId"] = this.courseId;
    data["content"] = this.content;
    data["createUser"] = this.createUser;
    data["createDate"] = this.createDate;
    data["createUserFullName"] = this.createUserFullName;
    data["createUserAvatar"] = this.createUserAvatar;
    data["courseName"] = this.courseName;
    data["courseKeyword"] = this.courseKeyword;
    data["courseImage"] = this.courseImage;
    return data;
  }
}