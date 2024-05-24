import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<String?> blurAndGet(String data) async {
  debugPrint("upload");
  var url = 'http://localhost:8000/blur_and_get';
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {},
      body: json.encode({
        "data": data,
      }),
    );
    debugPrint("Response status: ${response.statusCode}");
    if (response.statusCode == 200) {
      final Map<String, dynamic> output = jsonDecode(response.body);
      return output['data'];
    } else {
      debugPrint("Failed to upload image: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    debugPrint("Error: $e");
    return null;
  }
}
