import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerWidget extends StatefulWidget {
  NumberPickerWidget(
      {super.key, required this.mainValue, required this.executable});

  int mainValue;
  final void Function(int newValue) executable;

  @override
  State<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: NumberPicker(
            axis: Axis.horizontal,
            itemWidth: 50.0,
            selectedTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontSize: 30.0,
            ),
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontSize: 18.0,
            ),
            minValue: 0,
            maxValue: 20,
            value: widget.mainValue,
            onChanged: widget.executable,
          ),
        ),
      ),
    );
  }
}
