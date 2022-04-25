import 'package:desafio_vitor/app/modules/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDescriptionBottomSheet({
  required String title,
  required String body,
}) {
  Get.bottomSheet(
    AppDescriptionBottomSheet(
      title: title,
      body: body,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14), topRight: Radius.circular(14)),
    ),
    backgroundColor: Color(0xfff4efff),
  );
}

class AppDescriptionBottomSheet extends StatelessWidget {
  final String title;
  final String body;
  const AppDescriptionBottomSheet({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
              color: Color(0xff2cd9ff),
            ),
            child: Center(
              child: Text(
                "description".tr,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Text(
                title,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Text(
                body,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Color.fromARGB(255, 148, 146, 146),
                    ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: AppButton(
              child: Text(
                "return".tr,
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
