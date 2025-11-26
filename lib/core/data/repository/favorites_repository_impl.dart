import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vorratgo/core/data/model/favorite_item.dart';
import 'package:vorratgo/core/data/repository/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FavoritesRepositoryImpl(this._auth, this._firestore);

  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection("users");

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserDocSnapshot(
    String userId,
  ) {
    final docRef = _users.doc(userId);
    return docRef.get();
  }

  @override
  Future<void> addToFavorites(String userId, FavoriteItem item) async {
    final userDocRef = _users.doc(userId);

    final snapshot = await userDocRef.get();
    Map<String, dynamic> data = snapshot.data() ?? {};

    final rawFavorites = data['favorites'];
    final List<Map<String, dynamic>> favorites =
        (rawFavorites is List)
            ? rawFavorites.map((e) => Map<String, dynamic>.from(e as Map)).toList()
            : <Map<String, dynamic>>[];

    // Check if item already exists
    final index = favorites.indexWhere((fav) => fav["productId"] == item.productId);

    if (index == -1) {
      // Add new favorite item
      favorites.add(item.toMap());
    }
    // If already exists, do nothing (it's already a favorite)

    data['favorites'] = favorites;
    if (snapshot.exists) {
      await userDocRef.update({"favorites": favorites});
    } else {
      await userDocRef.set(data);
    }
  }

  @override
  Future<void> removeFromFavorites(String userId, String productId) async {
    final userDocRef = _users.doc(userId);
    final snapshot = await userDocRef.get();
    final data = snapshot.data() ?? {};

    final rawFavorites = data['favorites'];
    final List<Map<String, dynamic>> favorites =
        (rawFavorites is List)
            ? rawFavorites.map((e) => Map<String, dynamic>.from(e as Map)).toList()
            : <Map<String, dynamic>>[];

    favorites.removeWhere((item) => item["productId"] == productId);

    if (snapshot.exists) {
      await userDocRef.update({"favorites": favorites});
    } else {
      await userDocRef.set({"favorites": favorites});
    }
  }

  @override
  Future<Map<String, dynamic>?> fetchFavorites(String userId) async {
    final snapshot = await _users.doc(userId).get();
    final data = snapshot.data() ?? {};
    return {"favorites": data['favorites'] ?? []};
  }

  @override
  Future<bool> isFavorite(String userId, String productId) async {
    final snapshot = await _users.doc(userId).get();
    final data = snapshot.data() ?? {};

    final rawFavorites = data['favorites'];
    final List<Map<String, dynamic>> favorites =
        (rawFavorites is List)
            ? rawFavorites.map((e) => Map<String, dynamic>.from(e as Map)).toList()
            : <Map<String, dynamic>>[];

    return favorites.any((item) => item["productId"] == productId);
  }

  @override
  Future<void> clearFavorites(String userId) async {
    final userDocRef = _users.doc(userId);
    final snapshot = await userDocRef.get();

    if (snapshot.exists) {
      await userDocRef.update({"favorites": []});
    } else {
      await userDocRef.set({"favorites": []});
    }
  }
}
