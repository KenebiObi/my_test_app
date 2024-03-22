import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedPasswordTileWidget extends StatelessWidget {
  const SavedPasswordTileWidget(this.account, this.password, {super.key});

  final String account;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          width: double.infinity,
          height: 70.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(account),
                  Text(password),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
