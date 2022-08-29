import 'package:dio/dio.dart';
import 'package:mrbutclone/network/network_provider.dart';

class CourseRepository{
  ApiProvider _provider = ApiProvider();
  Future<Response> getAllCourses() async{
    Response response = await _provider.get('api/v1/public/search-courses',null);
    return response;
  }
  Future<Response> getDetailsCourse(String id) async{
    Response response = await _provider.get('api/v1/public/course/$id',null);
    print(response);
    return response;

  }
}