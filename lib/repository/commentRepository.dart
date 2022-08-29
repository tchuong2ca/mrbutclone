import 'package:dio/dio.dart';
import 'package:mrbutclone/network/network_provider.dart';

class CommentRepository{
  ApiProvider _provider = ApiProvider();
  Future<Response> getAllComment() async{
    Response response = await _provider.get('api/v1/public/comment/course',null);
    return response;
  }
}