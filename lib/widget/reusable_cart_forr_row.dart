import 'package:animate_do/animate_do.dart';
import 'package:fashon_app/widget/resuable_text.dart';
import 'package:flutter/material.dart';

class ReusbleCareForRow extends StatelessWidget {
  const ReusbleCareForRow({Key? key, required this.price, required this.text})
      : super(key: key);
  final double price;
  final String text;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style:
                textTheme.headline5?.copyWith(fontSize: 16, color: Colors.grey),
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 400),
            child: ReUsableTextForDetails(
              text: price.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
