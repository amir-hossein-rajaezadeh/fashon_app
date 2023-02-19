
import 'package:flutter/material.dart';

import '../base/base_view_model.dart';
import '../utils/constants.dart';

class ReUsableTextForDetails extends StatelessWidget {
  const ReUsableTextForDetails({
    Key? key,
    required this.text,
   }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
        var textTheme = Theme.of(context).textTheme;

    return RichText(
      text: TextSpan(
        text: "€",
        style: textTheme.subtitle2?.copyWith(
            fontSize: 21,
            color: primaryColor,
            fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text:text,
            style: textTheme.subtitle2?.copyWith(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
