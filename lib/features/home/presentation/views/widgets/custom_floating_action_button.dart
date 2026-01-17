import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_development_task/core/routes/app_routes.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
       context.push(AppRoutes.cart);
      },
      backgroundColor: Colors.white,
      child: Icon(CupertinoIcons.bag, color: Colors.red),
    );
  }
}
