import 'package:flutter/material.dart';

class BaseShape extends StatelessWidget {
  const BaseShape(
      {super.key,
      required this.child,
      required this.positionX,
      required this.positionY});
  final Widget child;
  final double positionX;
  final double positionY;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment(
          positionX / screenSize.width, positionY / screenSize.height),
      child: Container(
        width: screenSize.width / 2.3,
        height: screenSize.width / 5,
        decoration: BoxDecoration(
          color: const Color.fromARGB(58, 18, 21, 16),
          borderRadius: BorderRadius.circular(50),
        ),
        child: child,
      ),
    );
  }
}
