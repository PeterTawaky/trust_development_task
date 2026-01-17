import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 7.w(context),
      children: [
        GestureDetector(
          onTap: () => setState(() {
            //will delete by api
          }),
          child: CircleAvatar(
            radius: 16.r(context),
            backgroundColor: Colors.grey,
            child: Icon(
              CupertinoIcons.delete,
              color: context.theme.colorScheme.primaryContainer,
              size: 16.sp(context),
            ),
          ),
        ),
        Text(quantity.toString(), style: context.theme.textTheme.titleLarge),
        GestureDetector(
          onTap: () => setState(() {
            quantity++;
          }),
          child: CircleAvatar(
            radius: 16.r(context),
            backgroundColor: context.theme.colorScheme.primary,
            child: Icon(
              CupertinoIcons.add,
              color: context.theme.scaffoldBackgroundColor,
              size: 16.sp(context),
            ),
          ),
        ),
      ],
    );
  }
}
