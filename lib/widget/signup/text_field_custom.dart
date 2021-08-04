import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String? text;
  final String? text2;
  final TextInputType? keyboardType;
  final bool? obscureText;
  TextFieldCustom({
    Key? key,
    this.text,
    this.text2,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Apelido',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Como aparecerá em seus anúncios!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
