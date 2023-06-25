import 'package:e_commerce_online/features/login/domain/entities/login_entity.dart';
import 'package:e_commerce_online/features/sign_up/domain/entities/SignUpEntity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    this.message,
    required super.user,
    required super.token,
  });

  LoginModel.fromJson(dynamic json)
      : this(
            token: json['token'],
            user: User.fromJson(json['user']),
            message: json['message']);

  String? message;
}

class User extends UserEntity {
  User({this.role, required String name, required String email})
      : super(name: name, email: email);

  User.fromJson(dynamic json)
      : this(role: json['role'], name: json['name'], email: json['email']);

  String? role;
}
