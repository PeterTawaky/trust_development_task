import 'package:animate_to/animate_to.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trust_development_task/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:trust_development_task/features/home/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:trust_development_task/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ValueNotifier<int> selected = ValueNotifier(0);
  ValueNotifier<PageController> controller = ValueNotifier(.new());
  final AnimateToController animateToController = AnimateToController();

  @override
  void dispose() {
    selected.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //to make floating action button notch transparent
      bottomNavigationBar: CustomBottomNavBar(
        controller: controller,
        selected: selected,
      ),
      floatingActionButton: AnimateTo(
        controller: animateToController,
        child: const CustomFloatingActionButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Provider.value(
        value: animateToController,
        child: HomeViewBody(controller: controller, selected: selected)),
    );
  }
}
