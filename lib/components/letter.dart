import 'package:flutter/material.dart';

import 'letter_content.dart';

class Letter extends StatelessWidget {
  const Letter({super.key});

  @override
  Widget build(Object context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        constraints: const BoxConstraints(maxWidth: 340),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(child: LetterContent()),
            ],
          ),
        ),
      );
}
