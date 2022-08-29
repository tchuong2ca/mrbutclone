import 'package:dio/dio.dart';
import 'package:mrbutclone/network/network_provider.dart';

class CourseDetailRepository{
  ApiProvider _provider = ApiProvider();
  Future<Response> getDetailsCourse(String id) async{
    Response response = await _provider.get('api/v1/public/course/$id',null);
    print(response);
    return response;
  }
}