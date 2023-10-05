import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  const HeartButton({super.key});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Icon(
        Icons.favorite,
        size: 64,
        color: Colors.redAccent,
      ),
    );
  }
}
