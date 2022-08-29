import 'package:dio/dio.dart';
import 'package:mrbutclone/network/network_provider.dart';

class ClassRepository{
  ApiProvider _provider = ApiProvider();
  Future<Response> getAllClass() async{
    Response response = await _provider.get('api/v1/public/courses-class',null);
    return response;
  }
}