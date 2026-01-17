import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_development_task/core/routes/app_routes.dart';
import 'package:trust_development_task/features/cart/presentation/managers/cubit/cart_cubit.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.push(AppRoutes.cart);
      },
      backgroundColor: Colors.white,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final count = state is CartSuccess ? state.totalItems : 0;
          return Badge(
            label: Text(count.toString()),
            child: const Icon(CupertinoIcons.bag, color: Colors.red),
          );
        },
      ),
    );
  }
}
