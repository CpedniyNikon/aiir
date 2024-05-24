import 'package:learning_stuff/routes/routes.dart';
import 'package:learning_stuff/storage/upload_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.storage,
      page: () => const FileUploadPage(),
    ),
  ];
}
