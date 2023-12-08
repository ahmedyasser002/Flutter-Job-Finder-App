import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Boarding extends StatelessWidget {
  String imageUrl;
  RichText richText;
  String descriptionText;
  Boarding(
      {super.key, required this.imageUrl,
      required this.richText,
      required this.descriptionText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            imageUrl,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24
              ),
              child: richText),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, top: 10),
          child: Text(
            descriptionText,
            style: const TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
          ),
        )
      ],
    );
  }
}
