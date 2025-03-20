import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/login/model/login_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  Future<Either<String, LoginResponseModel>> loginRequest(
      {required String email, required String password}) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final loginResponseModel = await getUserData(uid: result.user?.uid ?? '');
      return Right(loginResponseModel);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? '');
    }
  }

  Future<LoginResponseModel> getUserData({required String uid}) async {
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final userData = snapshot.data();
    log('userData: $userData');
    LoginResponseModel loginResponseModel = LoginResponseModel.formJson(userData);
    return loginResponseModel;
  }
}
