import 'package:flutter/material.dart';

class CharacterOptionWidget extends StatefulWidget {
  const CharacterOptionWidget({
    required this.color,
    required this.icon,
    required this.chracterSelection,
    required this.onTap,
    super.key,
  });

  final Color color;
  final IconData icon;
  final String chracterSelection;
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
          padding: const EdgeInsets.only(right: 20.0),
          height: 70.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.color,
            // border: Border.all(
            //   width: 2.0,
            //   color: Theme.of(context).colorScheme.secondary,
            // ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  // color: Theme.of(context).colorScheme.primary,
                ),
                child: Icon(
                  widget.icon,
                  size: 30.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                widget.chracterSelection,
                style: const TextStyle(fontSize: 20.0),
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
