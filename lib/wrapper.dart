import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/page/letspage.dart';
import 'package:weather/page/login.dart';
import 'package:weather/services/auth_services.dart';

import 'model/user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? const MyLoginPage() : const LetsPage();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
