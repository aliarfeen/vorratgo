part of 'favorites_cubit.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<FavoriteItem> items;

  const FavoritesLoaded({required this.items});

  @override
  List<Object> get props => [items];
}

class FavoritesUpdated extends FavoritesState {
  final List<FavoriteItem> items;

  const FavoritesUpdated({required this.items});

  @override
  List<Object> get props => [items];
}

class FavoriteAdded extends FavoritesState {
  final FavoriteItem item;

  const FavoriteAdded({required this.item});

  @override
  List<Object> get props => [item];
}

class FavoriteRemoved extends FavoritesState {
  final String productId;

  const FavoriteRemoved({required this.productId});

  @override
  List<Object> get props => [productId];
}

class FavoritesEmpty extends FavoritesState {}

class FavoritesError extends FavoritesState {
  final String message;

  const FavoritesError(this.message);

  @override
  List<Object> get props => [message];
}
