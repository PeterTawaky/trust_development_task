import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_development_task/features/cart/presentation/managers/cubit/cart_cubit.dart';
import 'package:trust_development_task/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().fetchCartDetails();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CartViewBody());
  }
}
