import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      child: Container(
        padding: EdgeInsetsDirectional.all(10.h(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r(context)),
          border: Border.all(
            width: 0.5.w(context),
            color: context.theme.colorScheme.primaryContainer,
          ),
        ),
        child: Row(
          spacing: 4.w(context),
    
          children: [Icon(Icons.arrow_back), Text('Back')],
        ),
      ),
    );
  }
}