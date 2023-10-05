import 'package:flutter/material.dart';

class LetterContent extends StatelessWidget {
  const LetterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        _title('To My Beloved Wife'),
        const SizedBox(height: 12),
        _text(
            'Thank you for everything you do and have done for Sarah and me.'),
        const SizedBox(height: 8),
        _text('Thank you for fighting every day for our dreams.'),
        const SizedBox(height: 8),
        _text(
            'By your side, I know we can, because no matter what happens, nothing will make me give up trying to make you happy.'),
        const SizedBox(height: 8),
        _text(
            'I promise to love and respect you, to dedicate myself and show my passion and affection not only today, but every day that I have left.'),
        const SizedBox(height: 8),
        _text(
            'Thank you for making this world my paradise, for giving me dreams worth fighting for, for showing me what love is.'),
        const SizedBox(height: 8),
        _text('Forever Yours.'),
        const SizedBox(height: 16),
        _image(),
      ],
    );
  }

  Widget _title(String text) => Row(
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
        ],
      );

  Widget _text(String text) => Row(
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      );

  Widget _image() => Image.asset(
        'assets/images/rings.png',
        cacheHeight: 100,
        cacheWidth: 150,
      );
}
