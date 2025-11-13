abstract class UserRepository {
  Future<void> registerUser({
    required String email,
    required String password,
    required String username,
  });

  Future<Map<String, dynamic>?> loginUser({
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>?> updateUserData(String uid);
  Future<Map<String, dynamic>?> fetchUserData(String uid);

  Future<void> signOut();
}
