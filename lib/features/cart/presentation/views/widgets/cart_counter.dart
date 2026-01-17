import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';

class CartCounter extends StatefulWidget {
  final int initialValue;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  const CartCounter({
    super.key,
    this.initialValue = 1,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  late int quantity;
  bool isUpdating = false;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant CartCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      if (mounted) {
        setState(() {
          quantity = widget.initialValue;
          isUpdating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: isUpdating
              ? null
              : () {
                  if (widget.onDecrement != null) {
                    setState(() => isUpdating = true);
                    widget.onDecrement!();
                  }
                },
          child: CircleAvatar(
            radius: 16.r(context),
            backgroundColor: Colors.grey.withOpacity(0.2),
            child: Icon(
              CupertinoIcons.minus,
              color: context.theme.colorScheme.primary,
              size: 16.sp(context),
            ),
          ),
        ),
        SizedBox(width: 10.w(context)),
        if (isUpdating)
          SizedBox(
            width: 20.w(context),
            height: 20.h(context),
            child: const CircularProgressIndicator(strokeWidth: 2),
          )
        else
          Text(quantity.toString(), style: context.theme.textTheme.titleLarge),
        SizedBox(width: 10.w(context)),
        GestureDetector(
          onTap: isUpdating
              ? null
              : () {
                  if (widget.onIncrement != null) {
                    setState(() => isUpdating = true);
                    widget.onIncrement!();
                  }
                },
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
