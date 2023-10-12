import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: FloatingActionButton.extended(
          onPressed: context.read<ControllerAuthState>().login,
          label: Text('Login'),
        ),
      ),
    );
  }
}
