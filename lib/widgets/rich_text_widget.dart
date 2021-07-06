import 'package:flutter/material.dart';
import 'package:job_app/model/theme_model.dart';
import 'package:provider/provider.dart';

class RichTextWidget extends StatelessWidget {
  final String label;
  final String value;
  const RichTextWidget({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: TextStyle(color: Colors.blueGrey[400], fontSize: 12.0),
        children: [
          TextSpan(
              text: value,
              style: TextStyle(
                color: Provider.of<ThemeModel>(context).getTextColor(),
              ))
        ],
      ),
    );
  }
}
