import 'package:flutter/material.dart';
import 'brightness_button.dart';

class AppBarWrapper extends StatefulWidget {
  const AppBarWrapper(
      {super.key,
      required this.child,
      required this.handleBrightnessChange,
      required this.title});

  final Widget child;
  final Function handleBrightnessChange;
  final String title;
  @override
  _AppBarWrapperState createState() => _AppBarWrapperState();
}

class _AppBarWrapperState extends State<AppBarWrapper> {
  PreferredSizeWidget createAppBarWrapper() {
    return AppBar(
      title: Text("Rangers - ${widget.title}"),
      actions: [
        BrightnessButton(handleBrightnessChange: widget.handleBrightnessChange),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarWrapper(),
      body: widget.child,
    );
  }
}
