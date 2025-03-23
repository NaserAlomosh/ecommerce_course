import 'package:ecommerce/features/login/model/login_response_model.dart';

class UserDataService {
  UserDataService._();

  static String? email;
  static String? username;
  static String? uid;
  static String? phone;

  static void setSaveUserData(LoginResponseModel loginResponseModel) {
    email = loginResponseModel.email;
    username = loginResponseModel.username;
    uid = loginResponseModel.uid;
    phone = loginResponseModel.phone;
  }

  static Future<void> dispose() async {
    email = null;
    username = null;
    uid = null;
    phone = null;
  }
}
