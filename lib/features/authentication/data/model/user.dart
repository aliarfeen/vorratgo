class User {
  final String uid;
  final String email;
  final String? displayName;
  final String? photo;

  User({required this.uid, required this.email, this.displayName, this.photo});
}
