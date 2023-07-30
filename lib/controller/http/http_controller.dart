
import '../../model/post/post_model.dart';

abstract class HTTPController {
  Future<List<PostModel>?> getPosts();
}
