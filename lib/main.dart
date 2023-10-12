import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller.dart';
import 'package:test/home.dart';
import 'package:test/login_page.dart';
import 'package:test/states.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ControllerAuthState(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControllerAuthState>();
    return ValueListenableBuilder<AuthState>(
      valueListenable: controller,
      builder: (_, value, __) {
        if (value is LogoutAuthState) {
          return const LoginPage();
        }

        if (value is LoggedAuthState) {
          return const HomePage();
        }

        if (value is LoadingAuthState) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }

        return const Center(child: Text('erro na main'));
      },
    );
  }
}
