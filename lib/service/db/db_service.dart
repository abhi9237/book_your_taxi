import 'package:book_your_taxi/service/db/repo/db_repository.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DbService implements DbRepository {
  final SupabaseClient client = Get.find<SupabaseClient>();

  @override
  Future<List<Map<String, dynamic>>> addUser({
    required String dbName,
    Map<String, dynamic>? data,
  }) async {
    final response = await client
        .from(dbName)
        .insert(data ?? {})
        .select();
    return response;
  }

  @override
  Future<void> deleteUser({required int id, required String dbName}) async {
    await client.from(dbName).delete().eq('id', id);
  }

  @override
  Future<List<dynamic>> getUsers({required String dbName}) async {
    final response = await client.from(dbName).select();
    return response;
  }

  @override
  Future<void> updateUser({
    required String dbName,
    int? id,
    Map<String, dynamic>? data,
  }) async {
    await client.from(dbName).update(data ?? {}).eq('id', id ?? '');
  }
}
