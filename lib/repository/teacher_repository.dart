import 'package:dio/dio.dart';
import 'package:mrbutclone/network/network_provider.dart';

class TeacherRepository{
  ApiProvider _provider = ApiProvider();
  Map<String, dynamic> query={
    'startRecord': '0',
    'size': '20'
  };
  Future<Response> getAllTeacher() async{
    Response response = await _provider.get('api/v1/public/teachers',query);
    return response;
  }
}