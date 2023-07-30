import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oop_example/controller/http/http_controller.dart';

import '../../../model/post/post_model.dart';
import '../http_service_consts.dart';

class HTTPProvider extends HTTPController {

  @override
  Future<List<PostModel>?> getPosts() async {
    http.Response response = await http.get(Uri.parse(API_BASE_URL));
    if (response.statusCode == 200) {
      List<PostModel> posts = [];
      List dataList = jsonDecode(response.body);
      for (var dataJson in dataList) {
        PostModel post = PostModel.fromJson(dataJson);
        posts.add(post);
      }
      return posts;
    }
    return null;
  }
}
