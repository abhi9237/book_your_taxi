import 'package:book_your_taxi/service/db/db_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => Supabase.instance.client, fenix: true);
    // Get.lazyPut(() => DbService(), fenix: true);
  }
}
