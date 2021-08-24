import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSourceModel extends StatelessWidget {
  const ImageSourceModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid)
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Câmera',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Galeria',
              ),
            ),
          ],
        ),
      );
    else
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o anúncio!'),
        message: const Text('Selecione a origem da imagem'),
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {},
            child: Text(
              'Câmera',
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: Text(
              'Galeria',
            ),
          ),
        ],
      );
  }
}
