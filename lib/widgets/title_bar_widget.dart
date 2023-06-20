import "package:flutter/material.dart";

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth - 40.0,
      child: Row(
        children: [
          const Text(
            "Naomi Ezeugo",
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.purple[100],
            ),
            clipBehavior: Clip.hardEdge,
            child: const Image(
              width: 50.0,
              height: 50.0,
              image: AssetImage("assets/images/profile_pic.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
