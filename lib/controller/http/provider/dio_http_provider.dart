import 'package:dio/dio.dart';
import 'package:oop_example/controller/http/http_controller.dart';

import '../../../model/post/post_model.dart';
import '../http_service_consts.dart';

class DioProvider extends HTTPController {
  final Dio _dio = Dio();

  Future<List<PostModel>?> getPosts() async {
    Response response = await _dio.get(API_BASE_URL);
    if (response.statusCode == 200) {
      List<PostModel> posts = [];
      print('Data --> ${response.data}');
      List dataList = response.data;
      for (var dataJson in dataList) {
        PostModel post = PostModel.fromJson(dataJson);
        print('Post ---> ${post.id}');
        posts.add(post);
      }
      return posts;
    }
    return null;
  }
}
