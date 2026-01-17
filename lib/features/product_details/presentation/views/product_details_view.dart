import 'package:animate_to/animate_to.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trust_development_task/features/product_details/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final AnimateToController animateToController = AnimateToController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: animateToController,
        child: const ProductDetailsViewBody(),
      ),
    );
  }
}
