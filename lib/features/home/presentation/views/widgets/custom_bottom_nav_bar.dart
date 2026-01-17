import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:trust_development_task/core/utils/app_strings.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';

class CustomBottomNavBar extends StatelessWidget {
  final ValueNotifier<PageController> controller;
  final ValueNotifier<int> selected;

  const CustomBottomNavBar({
    super.key,
    required this.controller,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selected,
      builder: (context, value, child) {
        return StylishBottomBar(
          option: AnimatedBarOptions(iconStyle: IconStyle.Default),
          hasNotch: true,
          fabLocation: StylishBarFabLocation.center,
          currentIndex: value,
          notchStyle: NotchStyle.square,

          items: [
            BottomBarItem(
              icon: const Icon(Iconsax.home_2),
              selectedIcon: const Icon(Iconsax.home_2),
              selectedColor:context.theme.colorScheme.primary,
              title: const Text(AppStrings.home),
            ),
            BottomBarItem(
              icon: const Icon(Iconsax.receipt_item),
              selectedIcon: const Icon(Iconsax.receipt_item),
              selectedColor: context.theme.colorScheme.primary,
              title: const Text(AppStrings.menu),
            ),
            BottomBarItem(
              icon: const Icon(Icons.style_outlined),
              selectedIcon: const Icon(Icons.style),
              selectedColor: context.theme.colorScheme.primary,
              title: const Text(AppStrings.offers),
            ),
            BottomBarItem(
              icon: const Icon(Iconsax.user),
              selectedIcon: const Icon(Iconsax.user),
              selectedColor: context.theme.colorScheme.primary,
              title: const Text(AppStrings.account),
            ),
          ],

          onTap: (index) {
            if (index == selected.value) return;
            controller.value.jumpToPage(index);
            selected.value = index;
          },
        );
      },
    );
  }
}
