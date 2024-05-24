import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_stuff/storage/requests/blur_and_get.dart';
import 'package:universal_html/html.dart' as html;

class BlurAndGetButton extends StatefulWidget {
  const BlurAndGetButton({super.key});

  @override
  State<BlurAndGetButton> createState() => _FileUploadButtonState();
}

class _FileUploadButtonState extends State<BlurAndGetButton> {
  String? _base64Image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          child: const Text('blur and get'),
          onPressed: () async {
            var uploadInput = html.FileUploadInputElement();
            uploadInput.click();
            uploadInput.onChange.listen((e) {
              final files = uploadInput.files;
              if (files?.length == 1) {
                final file = files!.first;
                html.FileReader reader = html.FileReader();
                reader.onLoadEnd.listen((e) async {
                  var uploadedImage = reader.result as Uint8List;
                  String base64Image = base64Encode(uploadedImage);
                  String? modifiedImage = await blurAndGet(base64Image);
                  if (modifiedImage != null) {
                    setState(() {
                      _base64Image = modifiedImage;
                    });
                  }
                });
                reader.readAsArrayBuffer(file);
              }
            });
          },
        ),
        (_base64Image != null)
            ? Image.memory(
              base64Decode(_base64Image!),
              fit: BoxFit.contain,
            )
            : Container(),
      ],
    );
  }
}
