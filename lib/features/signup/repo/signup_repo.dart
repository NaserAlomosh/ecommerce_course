import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/signup/model/signup_request_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupRepo {
  Future<Either<String, UserCredential>> createAccountRequest({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveUserDataInDatabase(
        signupData: SignupRequestModel(
          email: credential.user?.email ?? '',
          uid: credential.user?.uid ?? '',
          username: username,
          phone: phone,
        ),
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      return Left(errorMessage);
    }
  }

  Future<void> _saveUserDataInDatabase({
    required SignupRequestModel signupData,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(signupData.uid)
        .set(signupData.toJson());
  }
}
