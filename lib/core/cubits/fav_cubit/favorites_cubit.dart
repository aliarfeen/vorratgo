import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vorratgo/core/data/model/favorite_item.dart';
import 'package:vorratgo/core/data/repository/favorites_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository repo;

  FavoritesCubit(this.repo) : super(FavoritesInitial());

  List<FavoriteItem> items = [];
  Set<String> favoriteProductIds = {}; // For quick lookup

  // ---------------- FETCH FAVORITES FROM FIREBASE ----------------
  Future<void> fetchFavoritesFirebase(String userId) async {
    try {
      final favoritesData = await repo.fetchFavorites(userId);

      final raw = favoritesData?['favorites'];
      if (raw is List) {
        items = raw
            .map((e) => FavoriteItem.fromMap(Map<String, dynamic>.from(e)))
            .toList();
        favoriteProductIds = items.map((item) => item.productId).toSet();
      } else {
        items = [];
        favoriteProductIds = {};
      }

      emit(FavoritesLoaded(items: List.from(items)));
    } catch (e) {
      emit(FavoritesError('Failed to fetch favorites: $e'));
    }
  }

  // ---------------- ADD TO FAVORITES (FIREBASE) ----------------
  Future<void> addToFavoritesFirebase(String userId, FavoriteItem item) async {
    try {
      await repo.addToFavorites(userId, item);
      await fetchFavoritesFirebase(userId);
    } catch (e) {
      emit(FavoritesError('Failed to add to favorites: $e'));
    }
  }

  // ---------------- REMOVE FROM FAVORITES (FIREBASE) ----------------
  Future<void> removeFromFavoritesFirebase(String userId, String productId) async {
    try {
      await repo.removeFromFavorites(userId, productId);
      await fetchFavoritesFirebase(userId);
    } catch (e) {
      emit(FavoritesError('Failed to remove from favorites: $e'));
    }
  }

  // ---------------- TOGGLE FAVORITE (FIREBASE) ----------------
  Future<void> toggleFavoriteFirebase(String userId, FavoriteItem item) async {
    try {
      if (isFavorite(item.productId)) {
        await removeFromFavoritesFirebase(userId, item.productId);
      } else {
        await addToFavoritesFirebase(userId, item);
      }
    } catch (e) {
      emit(FavoritesError('Failed to toggle favorite: $e'));
    }
  }

  // ---------------- CHECK IF FAVORITE (LOCAL) ----------------
  bool isFavorite(String productId) {
    return favoriteProductIds.contains(productId);
  }

  // ---------------- CLEAR FAVORITES (FIREBASE) ----------------
  Future<void> clearFavoritesFirebase(String userId) async {
    try {
      await repo.clearFavorites(userId);
      items.clear();
      favoriteProductIds.clear();
      emit(FavoritesEmpty());
    } catch (e) {
      emit(FavoritesError('Failed to clear favorites: $e'));
    }
  }

  // ------------------------------------------------
  // ---------- LOCAL FUNCTIONS (OPTIONAL) ----------
  // ------------------------------------------------

  void addToFavoritesLocal(FavoriteItem item) {
    if (!favoriteProductIds.contains(item.productId)) {
      items.add(item);
      favoriteProductIds.add(item.productId);
      emit(FavoritesUpdated(items: List.from(items)));
    }
  }

  void removeFromFavoritesLocal(String productId) {
    items.removeWhere((i) => i.productId == productId);
    favoriteProductIds.remove(productId);
    emit(FavoritesUpdated(items: List.from(items)));
  }

  void clearFavoritesLocal() {
    items.clear();
    favoriteProductIds.clear();
    emit(FavoritesEmpty());
  }
}
