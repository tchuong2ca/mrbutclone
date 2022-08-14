class Mess {
  int? code;
  String? description;

  Mess({this.code, this.description});

  Mess.fromJson(Map<String, dynamic> json) {
    this.code = json["code"];
    this.description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["description"] = this.description;
    return data;
  }
}