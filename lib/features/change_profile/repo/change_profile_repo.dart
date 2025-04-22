import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/local/local_storage_service.dart';
import 'package:ecommerce/core/local/user_data.dart';

class ChangeProfileRepo {
  Future<Either<String, void>> updateProfileData(
    String username,
    String phone,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(UserDataService.uid)
          .update({
        'username': username,
        'phone': phone,
      });
      LocalStorageService.instance.setPhone(phone);
      UserDataService.phone = phone;
      LocalStorageService.instance.setUsername(phone);
      UserDataService.username = username;

      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
