import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModel extends StatelessWidget {
  const ImageSourceModel(
    this.onImageSelected, {
    Key? key,
  }) : super(key: key);
  final Function(File) onImageSelected;

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
    if (picketFile == null) return;
    imageSelected(
      File(picketFile.path),
    );
  }

  Future<void> getFromGaleria() async {
    final picketFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picketFile == null) return;
    imageSelected(
      File(picketFile.path),
    );
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Editar Imagem',
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: IOSUiSettings(
        title: 'Editar Imagem',
        cancelButtonTitle: 'Cancelar',
        doneButtonTitle: 'Concluir',
      ),
    );
    onImageSelected(croppedFile!);
  }
}
