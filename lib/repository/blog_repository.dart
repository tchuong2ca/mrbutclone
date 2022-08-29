import 'package:dio/dio.dart';
import 'package:mrbutclone/network/network_provider.dart';

class BlogRepository{
  ApiProvider _provider = ApiProvider();
  Future<Response> getAllBlog() async{
    Response response = await _provider.get('api/v1/public/blog', null);
    return response;
  }
}