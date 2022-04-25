import 'package:desafio_vitor/app/data/model/post_model.dart';

import '../provider/post_provider.dart';

class PostRepository {
  final PostApi api;

  PostRepository(this.api);

  Future<List<Post>> getPosts() async {
    List<Post> listPost = [];
    var response = await api.getPostResponse();
    try {
      if (response.statusCode == 200) {
        for (var item in response.body) {
          var post = Post.fromJson(item);
          listPost.add(post);
        }
      }
    } catch (e) {
      print(e);
    }
    return listPost;
  }
}
