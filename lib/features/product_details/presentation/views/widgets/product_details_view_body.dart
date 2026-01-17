import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_development_task/core/routes/app_routes.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/core/widgets/back_arrow.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.w(context),
        vertical: 10.h(context),
      ),
      child: Stack(
        children: [
          ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackArrow(),
                  Text(
                    'Product Details',
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(AppRoutes.cart);
                    },
                    icon: Badge(
                      label: Text('3'), // The number to display
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primary, // Uses your red brand color
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        CupertinoIcons.bag,
                        color: Colors.red,
                        size: 30.sp(context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h(context)),
              CachedNetworkImage(
                height: context.screenWidth * 0.8,
                width: context.screenWidth,
                imageUrl:
                    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=500',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r(context)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              SizedBox(height: 10.h(context)),
              Text('Product Name', style: context.theme.textTheme.bodyLarge),
              SizedBox(height: 10.h(context)),
              Row(
                children: [
                  Text('250 LE', style: context.theme.textTheme.titleLarge),
                  Spacer(),
                  QuantityCounter(),
                ],
              ),
              SizedBox(height: 20.h(context)),
              Text(
                'any 3 sandwitches slider from your choice we are happy to serve you . well done',
                style: context.theme.textTheme.bodyLarge,
              ),
            ],
          ),
          ActionButton(title: 'add to cart'),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;
  const ActionButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        width: context.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r(context)),
          color: context.theme.colorScheme.primary,
        ),
        height: 60.h(context),
        child: Text(
          title,
          style: context.theme.textTheme.titleLarge!.copyWith(
            color: context.theme.scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({super.key});

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14.w(context),

      children: [
        GestureDetector(
          onTap: () => setState(() {
            if (quantity == 1) return;
            quantity--;
          }),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              CupertinoIcons.minus,
              color: context.theme.colorScheme.primaryContainer,
            ),
          ),
        ),
        Text(quantity.toString(), style: context.theme.textTheme.titleLarge),
        GestureDetector(
          onTap: () => setState(() {
            quantity++;
          }),
          child: CircleAvatar(
            backgroundColor: context.theme.colorScheme.primary,
            child: Icon(
              CupertinoIcons.plus,
              color: context.theme.scaffoldBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
