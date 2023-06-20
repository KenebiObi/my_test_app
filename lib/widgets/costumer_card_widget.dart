import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  CustomerCard({super.key, this.description = ""});
  String description;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width: deviceWidth - 20.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Flexible(
                      // Use Flexible widget to prevent overflow
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sis Aka",
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.right_chevron,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
