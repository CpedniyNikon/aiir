import 'dart:convert';
import 'package:learning_stuff/storage/utils/file.dart';
import 'package:universal_html/html.dart' as html;

void downloadFile(File file) {
  final byteData = const Base64Decoder().convert(file.base64Data);
  final blob = html.Blob([byteData]);

  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = file.filename;

  html.document.body?.children.add(anchor);
  anchor.click();

  html.document.body?.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}