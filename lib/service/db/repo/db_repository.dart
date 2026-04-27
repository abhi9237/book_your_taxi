abstract class DbRepository {
  Future<List<dynamic>> getUsers({required String dbName});

  Future<void> addUser({required String dbName, Map<String, dynamic>? data});

  Future<void> updateUser({
    required String dbName,
    int? id,
    Map<String, dynamic>? data,
  });

  Future<void> deleteUser({required int id, required String dbName});
}
