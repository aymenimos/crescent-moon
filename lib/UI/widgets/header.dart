import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final double fontSize;
  final TextStyle textStyle;

  const Header({
    super.key,
    required this.title,
    this.fontSize = 16,
    this.textStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              title,
              style: textStyle.copyWith(
                fontSize: fontSize,
                fontFamily: 'Nexa',
                shadows: [
                  const Shadow(color: Colors.black, offset: Offset(0, -5))
                ],
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationThickness: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
