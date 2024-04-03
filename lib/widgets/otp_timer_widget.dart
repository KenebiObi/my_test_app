import 'dart:async';

import 'package:flutter/material.dart';

class OTPTImerWidget extends StatefulWidget {
  // final bool start;
  OTPTImerWidget({
    super.key,
    // required this.start,
  });

  @override
  State<OTPTImerWidget> createState() => _OTPTImerWidgetState();
}

class _OTPTImerWidgetState extends State<OTPTImerWidget> {
  late Timer _timer;
  int _secondsRemaining = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void _restartTimer() {
    setState(() {
      _secondsRemaining = 60;
      _startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$_secondsRemaining seconds",
          style: const TextStyle(
            color: Color.fromRGBO(172, 172, 172, 1),
            fontFamily: "Lexend",
            fontSize: 14.0,
          ),
        ),
        TextButton(
          onPressed: _restartTimer,
          child: Text(
            "Resend OTP",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontFamily: "Lexend",
              fontSize: 14.0,
            ),
          ),
        )
      ],
    );
  }
}
