import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenTitleWidget extends StatelessWidget {
  ScreenTitleWidget({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.left_chevron,
            color: Colors.grey[600],
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 27.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
