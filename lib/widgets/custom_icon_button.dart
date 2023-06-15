import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.onPressed, required this.icon});
  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.grey[600]),
      highlightColor: Colors.white,
      splashRadius: 15,
    );
  }
}
