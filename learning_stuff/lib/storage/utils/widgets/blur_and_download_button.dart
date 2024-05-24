import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:learning_stuff/storage/requests/blur_and_download.dart';
import 'package:universal_html/html.dart' as html;

class BlurAndDownloadButton extends StatefulWidget {
  const BlurAndDownloadButton({super.key});

  @override
  State<BlurAndDownloadButton> createState() => _BlurAndDownloadButtonState();
}

class _BlurAndDownloadButtonState extends State<BlurAndDownloadButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('blur and download'),
      onPressed: () async {
        var uploadInput = html.FileUploadInputElement();
        uploadInput.click();
        uploadInput.onChange.listen((e) {
          final files = uploadInput.files;
          if (files?.length == 1) {
            final file = files!.first;
            html.FileReader reader = html.FileReader();
            reader.onLoadEnd.listen((e) {
              var uploadedImage = reader.result as Uint8List;
              String base64Image = base64Encode(uploadedImage);
              uploadAndDownload(file.name, base64Image);
            });
            reader.readAsArrayBuffer(file);
          }
        });
      },
    );
  }
}
