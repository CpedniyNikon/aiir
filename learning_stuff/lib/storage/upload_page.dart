import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_stuff/storage/utils/widgets/blur_and_download_button.dart';
import 'package:learning_stuff/storage/utils/widgets/blur_and_get_button.dart';
import 'package:learning_stuff/storage/utils/widgets/negative_and_download.dart';
import 'package:learning_stuff/storage/utils/widgets/negative_and_get.dart';

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({super.key});

  @override
  State<FileUploadPage> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlurAndDownloadButton(),
            Expanded(child: BlurAndGetButton()),
            NegativeAndDownloadButton(),
            Expanded(child: NegativeAndGetButton()),
          ],
        ),
      ),
    );
  }
}
