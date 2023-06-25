import 'package:e_commerce_online/features/login/domain/entities/login_entity.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  LoginEntity loginEntity;

  HomeScreen(this.loginEntity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ${loginEntity.user.name}"),
      ),
    );
  }
}
