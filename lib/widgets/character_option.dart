import 'package:flutter/material.dart';

class CharacterOptionWidget extends StatefulWidget {
  CharacterOptionWidget({
    required this.color,
    required this.icon,
    required this.chracterSelection,
    required this.onTap,
    super.key,
  });

  Color color;
  final IconData icon;
  String chracterSelection;
  final void Function() onTap;

  @override
  State<CharacterOptionWidget> createState() => _CharacterOptionWidgetState();
}

class _CharacterOptionWidgetState extends State<CharacterOptionWidget> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 70.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.color,
            border: Border.all(
              width: 2.0,
              color: Theme.of(context).primaryColorLight,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 30.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 10.0),
              Text(
                widget.chracterSelection,
                style: const TextStyle(fontSize: 16.0),
              ),
              const Spacer(),
              Checkbox(
                value: value,
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                onChanged: (bool? newValue) {
                  widget.onTap();

                  setState(() {
                    value = newValue;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
