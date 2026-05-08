import 'package:hive_ce/hive.dart';

import 'storage_keys.dart';

class HiveStorageService {
  HiveStorageService._();

  static Box<dynamic> get _box => Hive.box(StorageKeys.appBox);

  ///
  ///  Set Data
  ///

  static Future<void> storeUserToken(String token) async {
    await _box.put(StorageKeys.userToken, token);
  }

  static Future<void> storeEmailVerified(bool verify) async {
    await _box.put(StorageKeys.emailVerified, verify);
  }

  static Future<void> storeUserType(String type) async {
    await _box.put(StorageKeys.userType, type);
  }

  static Future<void> storePassCompleteProfile(bool type) async {
    await _box.put(StorageKeys.passCompleteProfile, type);
  }

  ///
  ///  Get Data
  ///

  static String? getUserToken() {
    return _box.get(StorageKeys.userToken) as String?;
  }

  static bool? getEmailVerify() {
    return _box.get(StorageKeys.emailVerified) as bool?;
  }

  static bool? passCompleteProfile() {
    return _box.get(StorageKeys.passCompleteProfile) as bool?;
  }

  static String? getUserType() {
    return _box.get(StorageKeys.userType) as String?;
  }

  static Future<void> eraseAllData() async {
    await _box.clear();
  }
}
