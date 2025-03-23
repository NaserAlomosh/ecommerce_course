import 'dart:developer';

import 'package:ecommerce/features/login/model/login_response_model.dart' show LoginResponseModel;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static FlutterSecureStorage? _storage;

  static LocalStorageService get instance {
    if (_instance == null) {
      LocalStorageService._init();
    }
    return _instance!;
  }

  LocalStorageService._init() {
    _instance = this;
    _storage = const FlutterSecureStorage();
  }

  Future<String?> getEmail() async {
    return await _storage?.read(key: 'email');
  }

  Future<void> setEmail(String email) async {
    await _storage?.write(key: 'email', value: email);
    log('email: $email save success');
  }

  Future<void> setUsername(String username) async {
    await _storage?.write(key: 'username', value: username);
  }

  Future<String?> getUsername() async {
    return _storage?.read(key: 'username');
  }

  Future<void> setUid(String uid) async {
    await _storage?.write(key: 'uid', value: uid);
  }

  Future<String?> getUid() async {
    return _storage?.read(key: 'uid');
  }

  Future<void> setPhone(String phone) async {
    await _storage?.write(key: 'phone', value: phone);
  }

  Future<String?> getPhone() async {
    return _storage?.read(key: 'phone');
  }

  Future<void> removeAll() async {
    await _storage?.deleteAll();
  }

  Future<void> setUserData(LoginResponseModel? loginResponseModel) async {
    await setEmail(loginResponseModel?.email ?? '');
    await setUsername(loginResponseModel?.username ?? '');
    await setUid(loginResponseModel?.uid ?? '');
    await setPhone(loginResponseModel?.phone ?? '');
  }

  Future<LoginResponseModel> getUserData() async {
    final email = await getEmail();
    final username = await getUsername();
    final uid = await getUid();
    final phone = await getPhone();
    return LoginResponseModel(
      email: email ?? '',
      username: username ?? '',
      uid: uid ?? '',
      phone: phone ?? '',
    );
  }
}
