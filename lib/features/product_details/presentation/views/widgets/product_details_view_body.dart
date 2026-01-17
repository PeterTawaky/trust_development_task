import 'package:animate_to/animate_to.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trust_development_task/core/routes/app_routes.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/core/widgets/back_arrow.dart';
import 'package:trust_development_task/core/widgets/custom_loading_widget.dart';
import 'package:trust_development_task/features/cart/presentation/managers/cubit/cart_cubit.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_addon_entity.dart';
import 'package:trust_development_task/features/product_details/presentation/managers/cubit/product_details_cubit.dart';
import 'package:trust_development_task/locale_keys.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  final Map<String, String> selectedAddons = {};
  int currentQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsSuccess) {
          final product = state.productDetails;
          final addons = state.productAddons;
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: 16.w(context),
              end: 16.w(context),
              top: 50.h(context),
              bottom: 10.h(context),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    // Fixed Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackArrow(),
                        Text(
                          LocaleKeys.productDetails,
                          style: context.theme.textTheme.bodyLarge,
                        ),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, cartState) {
                            final count = cartState is CartSuccess
                                ? cartState.totalItems
                                : 0;
                            return AnimateTo(
                              controller: context.read<AnimateToController>(),
                              child: IconButton(
                                onPressed: () {
                                  context.push(AppRoutes.cart);
                                },
                                icon: Badge(
                                  label: Text(count.toString()),
                                  backgroundColor:
                                      context.theme.colorScheme.primary,
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: Icon(
                                    CupertinoIcons.bag,
                                    color: Colors.red,
                                    size: 30.sp(context),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h(context)),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.only(bottom: 80.h(context)),
                        children: [
                          CachedNetworkImage(
                            height: context.screenWidth * 0.8,
                            width: context.screenWidth,
                            imageUrl: product.image,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.r(context),
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          SizedBox(height: 10.h(context)),
                          Text(
                            product.nameEn,
                            style: context.theme.textTheme.bodyLarge,
                          ),
                          SizedBox(height: 10.h(context)),
                          Row(
                            children: [
                              Text(
                                '${product.price} ${LocaleKeys.le}',
                                style: context.theme.textTheme.titleLarge,
                              ),
                              const Spacer(),
                              QuantityCounter(
                                onQuantityChanged: (quantity) {
                                  setState(() {
                                    currentQuantity = quantity;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h(context)),
                          Text(
                            context.isArabic
                                ? product.descriptionAr
                                : product.descriptionEn,
                            style: context.theme.textTheme.bodyMedium,
                          ),
                          SizedBox(height: 20.h(context)),
                          ...addons.map(
                            (addon) => AddonSection(
                              addon: addon,
                              onChanged: (selected) {
                                setState(() {
                                  selectedAddons[addon.id] = selected;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                AnimateFrom(
                  key: context.read<AnimateToController>().tag(product.id),
                  child: ActionButton(
                    title: LocaleKeys.addToCart,
                    onPressed: () async {
                      final controller = context.read<AnimateToController>();
                      controller.animate(controller.tag(product.id));

                      await context.read<ProductDetailsCubit>().addToCart(
                        productId: product.id,
                        quantity: currentQuantity,
                        addons: selectedAddons.values.toList(),
                      );

                      if (context.mounted) {
                        context.read<CartCubit>().fetchCartTotalItems();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProductDetailsError) {
          return Center(child: Text(state.error.message));
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}

class AddonSection extends StatefulWidget {
  final ProductAddonEntity addon;
  final ValueChanged<String> onChanged;
  const AddonSection({super.key, required this.addon, required this.onChanged});

  @override
  State<AddonSection> createState() => _AddonSectionState();
}

class _AddonSectionState extends State<AddonSection> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    for (var option in widget.addon.options) {
      if (option.selectedByDefault) {
        selectedOption = option.label;
        Future.microtask(() => widget.onChanged(option.label));
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h(context)),
          child: Text(
            widget.addon.title,
            style: context.theme.textTheme.titleLarge,
          ),
        ),
        ...widget.addon.options.map(
          (option) => RadioListTile<String>(
            contentPadding: EdgeInsets.zero,
            title: Text(option.label, style: context.theme.textTheme.bodyLarge),
            value: option.label,
            groupValue: selectedOption,
            activeColor: context.theme.colorScheme.primary,
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
              if (value != null) {
                widget.onChanged(value);
              }
            },
          ),
        ),
        SizedBox(height: 16.h(context)),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ActionButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onPressed,
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
      ),
    );
  }
}

class QuantityCounter extends StatefulWidget {
  final ValueChanged<int> onQuantityChanged;
  const QuantityCounter({super.key, required this.onQuantityChanged});

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
            widget.onQuantityChanged(quantity);
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
            widget.onQuantityChanged(quantity);
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
