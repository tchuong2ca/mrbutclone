import 'package:mrbutclone/model/commentData.dart';
import 'package:mrbutclone/model/listData.dart';

import 'mess.dart';

class CommentResponse{
  List<CommentData>? _commentData;
  Mess? _mess;
  CommentResponse(this._commentData, this._mess);

  CommentResponse.fromJson(Map<String, dynamic> json) {
   this._commentData=json["data"];
    this._mess = json["mess"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this._commentData != null)
      data['data'] = this._commentData;
    data["mess"] = this._mess;
    return data;
  }
}