import 'dart:io';
import 'package:image_picker/image_picker.dart';
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
              onPressed: getFromCamera,
              child: Text(
                'Câmera',
              ),
            ),
            TextButton(
              onPressed: getFromGaleria,
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
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: getFromCamera,
            child: Text(
              'Câmera',
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: getFromGaleria,
            child: Text(
              'Galeria',
            ),
          ),
        ],
      );
  }

  Future<void> getFromCamera() async {
    final picketFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    imageSelected(
      File(picketFile!.path),
    );
  }

  Future<void> getFromGaleria() async {
    final picketFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    imageSelected(
      File(picketFile!.path),
    );
  }

  void imageSelected(File image) {
    print(image.path);
  }
}
