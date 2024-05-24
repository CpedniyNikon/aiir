import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:learning_stuff/storage/requests/blur_and_download.dart';
import 'package:learning_stuff/storage/requests/negative_and_download.dart';
import 'package:universal_html/html.dart' as html;

class NegativeAndDownloadButton extends StatefulWidget {
  const NegativeAndDownloadButton({super.key});

  @override
  State<NegativeAndDownloadButton> createState() => _NegativeAndDownloadButtonState();
}

class _NegativeAndDownloadButtonState extends State<NegativeAndDownloadButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('negative and download'),
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
              negativeAndDownload(file.name, base64Image);
            });
            reader.readAsArrayBuffer(file);
          }
        });
      },
    );
  }
}
