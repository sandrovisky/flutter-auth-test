import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller.dart';
import 'package:test/states.dart';

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControllerAuthState>();
    print('third');
    print(controller.value);

    return Scaffold(
      appBar: AppBar(title: Text('sa'), actions: [
        IconButton(
            onPressed: () async => await controller.logout(context),
            icon: Icon(Icons.change_circle))
      ]),
      body: Center(child: Text('third')),
    );
  }
}
