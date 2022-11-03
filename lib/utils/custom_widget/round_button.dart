import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String label;
  final VoidCallback onPressed;

  const RoundButton({
    Key? key,
    this.width ,
    this.height,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff54383b)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ))),
        onPressed: onPressed,
        child: Text(label, style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
