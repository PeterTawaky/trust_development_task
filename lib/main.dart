import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trust_development_task/app/my_app.dart';
import 'package:trust_development_task/core/dependencies/service_locator.dart';
import 'package:trust_development_task/core/utils/app_functions.dart';

void main() {
  setupServiceLocator();
  getGuestUserID().then((id) {
    runApp(Provider.value(value: id, child: const MyApp()));
  });
}

Future<String> getGuestUserID() async {
  String userId = await AppFunctions.getUserID();
  return userId;
}
