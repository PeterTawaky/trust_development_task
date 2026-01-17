import 'package:flutter/material.dart';
import 'package:trust_development_task/core/utils/app_constants.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';

extension ResponsiveNum on num {
  double ac(BuildContext context) =>
      context.textScaler.scale(this * context.scaleText);
  double sp(BuildContext context) => this * context.scaleText;
  double r(BuildContext context) => this * context.scaleText;
  double w(BuildContext context) =>
      this / AppConstants.totalFigmaWidth * context.screenWidth;
  double h(BuildContext context) =>
      this / AppConstants.totalFigmaHeight * context.screenHeight;
}
