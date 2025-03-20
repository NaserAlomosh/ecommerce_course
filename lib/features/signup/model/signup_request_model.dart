class SignupRequestModel {
  final String email;

  final String username;
  final String phone;
  final String uid;

  SignupRequestModel({
    required this.email,
    required this.username,
    required this.phone,
    required this.uid,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "username": username,
      "phone": phone,
      "uid": uid,
    };
  }
}
