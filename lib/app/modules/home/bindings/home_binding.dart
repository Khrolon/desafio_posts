import 'package:desafio_vitor/app/data/provider/post_provider.dart';
import 'package:desafio_vitor/app/data/repository/post_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(PostRepository(PostApi())),
    );
  }
}
