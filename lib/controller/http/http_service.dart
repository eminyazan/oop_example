import '../../model/post/post_model.dart';
import 'http_controller.dart';

class HTTPService extends HTTPController{

  late HTTPController httpProvider;

  static final HTTPService _instance = HTTPService._internal();

  HTTPService._internal();

  factory HTTPService({
    required HTTPController httpProvider,
  }) {
    _instance.httpProvider = httpProvider;
    return _instance;
  }


  @override
  Future<List<PostModel>?> getPosts() => httpProvider.getPosts();
}
