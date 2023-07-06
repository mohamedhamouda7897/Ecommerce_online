import 'package:e_commerce_online/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';

import '../../../../../config/routes/routes.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                CacheHelper.removeData("User");
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
