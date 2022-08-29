
class TeacherListData {
  String? username;
  String? fullName;
  String? phoneNumber;
  String? picture;
  String? email;
  String? subject;
  String? exp;
  String? intro;

  TeacherListData({this.username, this.fullName, this.phoneNumber, this.picture, this.email, this.subject, this.exp, this.intro});

  TeacherListData.fromJson(Map<String, dynamic> json) {
    this.username = json["username"];
    this.fullName = json["fullName"];
    this.phoneNumber = json["phoneNumber"];
    this.picture = json["picture"];
    this.email = json["email"];
    this.subject = json["subject"];
    this.exp = json["exp"];
    this.intro = json["intro"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = this.username;
    data["fullName"] = this.fullName;
    data["phoneNumber"] = this.phoneNumber;
    data["picture"] = this.picture;
    data["email"] = this.email;
    data["subject"] = this.subject;
    data["exp"] = this.exp;
    data["intro"] = this.intro;
    return data;
  }
}