import 'package:desafio_vitor/app/data/repository/post_repository.dart';
import 'package:get/get.dart';

import '../../../data/model/post_model.dart';

class HomeController extends GetxController {
  final PostRepository postRepository;

  HomeController(this.postRepository);

  var listPost = <Post>[].obs;
  RxBool isAlreadyLoaded = false.obs;

  @override
  Future<void> onInit() async {
    getListPost();
    super.onInit();
  }

  getListPost() async {
    listPost.value = await postRepository.getPosts();
    isAlreadyLoaded.value = true;
  }
}
