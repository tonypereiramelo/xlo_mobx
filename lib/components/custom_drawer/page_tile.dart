import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  const PageTile(
      {Key? key, this.label, this.iconData, this.onTap, this.highLighted})
      : super(key: key);

  final String? label;
  final IconData? iconData;
  final VoidCallback? onTap;
  final bool? highLighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label.toString(),
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: highLighted! ? Colors.purple : Colors.black54,
        ),
      ),
      leading: Icon(
        iconData,
        color: highLighted! ? Colors.purple : Colors.black54,
      ),
      onTap: onTap,
    );
  }
}
