import 'package:trust_development_task/core/dependencies/service_locator.dart';
import 'package:trust_development_task/core/networking/api/api_constants.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';

class AppFunctions {
  AppFunctions._();

  static Future<String> getUserID() async {
    var id = await getIt<DioConsumer>().get(ApiConstants.guestId);
    return id['guest_id'];
  }
}
