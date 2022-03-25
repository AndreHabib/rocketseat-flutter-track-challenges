import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  UserModel({
    this.name,
    required this.email,
    required this.id,
    this.photoUrl,
  });

  String? name;
  String email;
  String id;
  String? photoUrl;

  factory UserModel.google(GoogleSignInAccount account) {
    return UserModel(
        name: account.displayName,
        email: account.email,
        id: account.id,
        photoUrl: account.photoUrl);
  }
}
