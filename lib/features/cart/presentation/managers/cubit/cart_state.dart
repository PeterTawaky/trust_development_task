part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final int totalItems;
  final CartDetailsEntity? cartDetails;
  CartSuccess({required this.totalItems, this.cartDetails});
}

final class CartError extends CartState {}
