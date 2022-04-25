import 'package:desafio_vitor/app/modules/widgets/app_button.dart';
import 'package:desafio_vitor/app/modules/widgets/app_get_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/post_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('post_challenge'.tr),
          centerTitle: true,
        ),
        body: Obx((() => _buildBody())));
  }

  Widget _buildBody() {
    //NOTE: Verifica se a lista da API já foi carregada, se não foi aguarda
    if (!controller.isAlreadyLoaded.value) {
      return Center(child: CircularProgressIndicator());
      //NOTE: Se já foi carregada, verifica se contem itens na lista.
    } else if (controller.listPost.isEmpty || controller.listPost.length == 0) {
      //NOTE: Se não contem, chama um botão para tentar novamente.
      return Container(
        alignment: Alignment.center,
        child: AppButton(
          child: Text("try_again".tr),
          onPressed: () {
            controller.isAlreadyLoaded.value = false;
            controller.getListPost();
          },
        ),
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: controller.listPost.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              tileColor: Color(0xfff4efff),
              title: Text(controller.listPost[index].title!.capitalizeFirst!, textAlign: TextAlign.center,),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(controller.listPost[index].body!.capitalizeFirst!),
              ),
              onTap: () {
                _buildBottomSheet(controller.listPost[index]);
              },
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xfff4efff), width: 4),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        },
      );
    }
  }

  _buildBottomSheet(Post post) {
    //NOTE: Chama o componente que utiliza o Get.BottomSheet.
    showDescriptionBottomSheet(
      title: post.title!.capitalizeFirst!,
      body: post.body!.capitalizeFirst!,
    );
  }
}
