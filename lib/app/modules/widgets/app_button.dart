import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  const AppButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        padding: EdgeInsets.all(10),
        child: child,
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff2cd9ff)),
      ),
    );
  }
}
