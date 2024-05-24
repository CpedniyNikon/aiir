import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:learning_stuff/storage/utils/file.dart';
import 'package:learning_stuff/storage/utils/functions/download_file.dart';

Future<void> negativeAndDownload(String name, String data) async {
  debugPrint("upload");
  var url = 'http://localhost:8000/negative_and_download';
  await http
      .post(Uri.parse(url),
      headers: {},
      body: json.encode({
        "name": name,
        "data": data,
      }))
      .then((http.Response response) {
    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.contentLength}");
    final Map output = jsonDecode(response.body);
    if (response.statusCode == 200) {
      File file = File();
      file.base64Data = output['data'];
      file.filename = output['name'];
      downloadFile(file);
    }
  });
}

