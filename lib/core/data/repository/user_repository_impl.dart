import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vorratgo/core/data/model/user.dart';
import 'package:vorratgo/core/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  UserRepositoryImpl(this._auth, this._firestore);

  @override
  Future<void> registerUser({
    required String email,
    required String password,
    required String username,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = UserModel(
      uid: userCredential.user!.uid,
      email: email,
      name: username,
      favorites: [],
      cart: [],
    );

    await _firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  @override
  Future<Map<String, dynamic>?> loginUser({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final doc =
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

    return doc.data();
  }

  @override
  Future<Map<String, dynamic>?> fetchUserData(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return doc.data();
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<Map<String, dynamic>?> updateUserData(String uid) async {
    final docRef = _firestore.collection('users').doc(uid);
    final snap = await docRef.get();

    if (!snap.exists) return null;

    final data = Map<String, dynamic>.from(snap.data() ?? {});

    // normalize cart and favorites (handle missing or different spellings)
    final cart = List<dynamic>.from(data['cart'] ?? []);
    final favorites = List<dynamic>.from(
      data['favorites'] ?? data['favourites'] ?? [],
    );

    // ensure stored document has the normalized fields
    await docRef.set({
      ...data,
      'cart': cart,
      'favorites': favorites,
    }, SetOptions(merge: true));

    final updatedSnap = await docRef.get();
    return updatedSnap.data();
  }
}
