import 'dart:convert';
import 'dart:developer';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../service/db/db_service.dart';

class SignUpRepository {
  DbService service = DbService();
  final _auth = Get.find<SupabaseClient>().auth;

  Future<void> sendOtpVerification(String email) async {
    try {
      ResendResponse response =  await _auth.resend(
        type: OtpType.signup,
        email: email,
      );

      log('Don${response.messageId ??''}');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
