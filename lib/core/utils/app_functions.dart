import 'package:trust_development_task/core/networking/api/api_constants.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';

class AppFunctions {
  AppFunctions._();

  static Future<String> getUserID() async {
    var id = await DioConsumer().get(
      ApiConstants.guestId,
      // queryParameters: {},
    );
    return id['guest_id'];
  }
}
