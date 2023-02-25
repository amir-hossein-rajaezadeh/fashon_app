import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton(
      {Key? key, required this.text, required this.size, required this.onTap})
      : super(key: key);

  final Size size;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onTap,
        minWidth: size.width * 0.9,
        height: size.height * 0.07,
        color: Colors.green[800],
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
