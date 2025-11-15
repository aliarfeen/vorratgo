part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;
  final double totalPrice;

  CartLoaded({required this.items, required this.totalPrice});

  @override
  List<Object> get props => [items, totalPrice];
}

class CartItemAdded extends CartState {
  final List<CartItem> items;
  final double totalPrice;

  CartItemAdded({required this.items, required this.totalPrice});

  @override
  List<Object> get props => [items, totalPrice];
}

class CartItemRemoved extends CartState {
  final List<CartItem> items;
  final double totalPrice;

  CartItemRemoved({required this.items, required this.totalPrice});

  @override
  List<Object> get props => [items, totalPrice];
}

class CartUpdated extends CartState {
  final List<CartItem> items;
  final double totalPrice;

  CartUpdated({required this.items, required this.totalPrice});

  @override
  List<Object> get props => [items, totalPrice];
}

class CartEmpty extends CartState {}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object> get props => [message];
}
