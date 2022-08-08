import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final Widget child;
  final Function? initState;
  const Wrapper({Key? key, required this.child, this.initState})
      : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    widget.initState!();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
