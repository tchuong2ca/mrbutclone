
class ClassListData {
  String? courseId;
  String? schoolId;
  String? folderId;
  String? type;
  String? code;
  String? name;
  String? shortname;
  String? keyword;
  String? image;
  String? intro;
  String? status;
  String? releaseStatus;
  String? learningmode;
  int? sortorder;
  int? studentCount;
  double? price;
  double? salePrice;
  double? totalIncome;
  int? totalLesson;
  int? totalChapter;
  int? accessLimit;
  String? openDate;
  String? createDate;
  String? createUser;
  String? grantStatus;
  int? rawGrade;
  String? cap;
  String? teacherUsername;
  String? teacherFullName;
  int? finishedDay;
  int? currentRating;
  bool? courseIt;

  ClassListData({this.courseId, this.schoolId, this.folderId, this.type, this.code, this.name, this.shortname, this.keyword, this.image, this.intro, this.status, this.releaseStatus, this.learningmode, this.sortorder, this.studentCount, this.price, this.salePrice, this.totalIncome, this.totalLesson, this.totalChapter, this.accessLimit, this.openDate, this.createDate, this.createUser, this.grantStatus, this.rawGrade, this.cap, this.teacherUsername, this.teacherFullName, this.finishedDay, this.currentRating, this.courseIt});

  ClassListData.fromJson(Map<String, dynamic> json) {
    this.courseId = json["courseId"];
    this.schoolId = json["schoolId"];
    this.folderId = json["folderId"];
    this.type = json["type"];
    this.code = json["code"];
    this.name = json["name"];
    this.shortname = json["shortname"];
    this.keyword = json["keyword"];
    this.image = json["image"];
    this.intro = json["intro"];
    this.status = json["status"];
    this.releaseStatus = json["releaseStatus"];
    this.learningmode = json["learningmode"];
    this.sortorder = json["sortorder"];
    this.studentCount = json["studentCount"];
    this.price = json["price"];
    this.salePrice = json["salePrice"];
    this.totalIncome = json["totalIncome"];
    this.totalLesson = json["totalLesson"];
    this.totalChapter = json["totalChapter"];
    this.accessLimit = json["accessLimit"];
    this.openDate = json["openDate"];
    this.createDate = json["createDate"];
    this.createUser = json["createUser"];
    this.grantStatus = json["grantStatus"];
    this.rawGrade = json["rawGrade"];
    this.cap = json["cap"];
    this.teacherUsername = json["teacherUsername"];
    this.teacherFullName = json["teacherFullName"];
    this.finishedDay = json["finishedDay"];
    this.currentRating = json["currentRating"];
    this.courseIt = json["courseIT"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["courseId"] = this.courseId;
    data["schoolId"] = this.schoolId;
    data["folderId"] = this.folderId;
    data["type"] = this.type;
    data["code"] = this.code;
    data["name"] = this.name;
    data["shortname"] = this.shortname;
    data["keyword"] = this.keyword;
    data["image"] = this.image;
    data["intro"] = this.intro;
    data["status"] = this.status;
    data["releaseStatus"] = this.releaseStatus;
    data["learningmode"] = this.learningmode;
    data["sortorder"] = this.sortorder;
    data["studentCount"] = this.studentCount;
    data["price"] = this.price;
    data["salePrice"] = this.salePrice;
    data["totalIncome"] = this.totalIncome;
    data["totalLesson"] = this.totalLesson;
    data["totalChapter"] = this.totalChapter;
    data["accessLimit"] = this.accessLimit;
    data["openDate"] = this.openDate;
    data["createDate"] = this.createDate;
    data["createUser"] = this.createUser;
    data["grantStatus"] = this.grantStatus;
    data["rawGrade"] = this.rawGrade;
    data["cap"] = this.cap;
    data["teacherUsername"] = this.teacherUsername;
    data["teacherFullName"] = this.teacherFullName;
    data["finishedDay"] = this.finishedDay;
    data["currentRating"] = this.currentRating;
    data["courseIT"] = this.courseIt;
    return data;
  }
}