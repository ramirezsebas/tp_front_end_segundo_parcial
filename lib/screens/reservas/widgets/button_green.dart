import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;

  ButtonGreen(
      {Key? key,
        required this.text,
        required this.onPressed,
        required this.height,
        required this.width});

  @override
  State<StatefulWidget> createState() {
    return _ButtonGreen();
  }
}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(
              colors: [Colors.red, Colors.redAccent],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}