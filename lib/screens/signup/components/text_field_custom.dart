import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatelessWidget {
  final String? text;
  final String? text2;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  TextFieldCustom({
    Key? key,
    this.text,
    this.text2,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Text(
                text!,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                text2!,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                isDense: true,
                hintText: hintText,
              ),
              keyboardType: keyboardType,
              obscureText: obscureText!,
              inputFormatters: inputFormatters,
            ),
          ),
        ],
      ),
    );
  }
}
