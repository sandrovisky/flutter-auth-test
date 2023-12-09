import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller.dart';
import 'package:test/test.dart';

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ControllerAuthState>();

    return ChangeNotifierProvider(
      create: (context) => Counter(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(title: Text('terceira tela'), actions: [
          IconButton(
              //eu acreditava q ele voltaria para tela de login
              onPressed: () async => await controller.logout(),
              icon: Icon(Icons.logout))
        ]),
        body: Builder(builder: (context) {
          final counter = context.watch<Counter>();
          return Center(child: Text(counter.value.toString()));
        }),
      ),
    );
  }
}
