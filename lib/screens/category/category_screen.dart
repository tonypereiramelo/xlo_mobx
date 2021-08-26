import 'package:flutter/material.dart';
import 'package:xlo_mobx/models/category.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key, required this.selected, this.showAll = true})
      : super(key: key);

  final Category selected;
  final bool showAll;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
