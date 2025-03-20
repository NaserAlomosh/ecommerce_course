class LoginResponseModel {
  final String email;
  final String username;
  final String phone;
  final String uid;

  LoginResponseModel({
    required this.email,
    required this.username,
    required this.phone,
    required this.uid,
  });
  factory LoginResponseModel.formJson(Map<String, dynamic>? data) {
    return LoginResponseModel(
      email: data?['email'],
      phone: data?['phone'],
      username: data?['username'],
      uid: data?['uid'],
    );
  }
}
