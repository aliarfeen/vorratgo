import 'package:vorratgo/core/data/model/favorite_item.dart';

abstract class FavoritesRepository {
  Future<void> addToFavorites(String userId, FavoriteItem item);
  Future<void> removeFromFavorites(String userId, String productId);
  Future<Map<String, dynamic>?> fetchFavorites(String userId);
  Future<bool> isFavorite(String userId, String productId);
  Future<void> clearFavorites(String userId);
}
