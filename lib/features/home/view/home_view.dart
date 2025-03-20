import 'package:ecommerce/features/login/model/login_response_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.user});
  final LoginResponseModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('email : ${user.email}'),
          Text('username : ${user.username}'),
          Text('phone : ${user.phone}'),
          Text('uid : ${user.uid}'),
        ],
      )),
    );
  }
}
