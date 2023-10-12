import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller.dart';
import 'package:test/states.dart';
import 'package:test/third.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControllerAuthState>();
    print(state.value);
    final value = state.value;
    try {
      if (value is LoggedAuthState) {
        return Scaffold(
          appBar: AppBar(title: Text('Home'), actions: [
            IconButton(
                onPressed: () async {
                  await state.logout(context);
                },
                icon: Icon(Icons.logout)),
            IconButton(
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Third()));
                },
                icon: Icon(Icons.next_plan)),
            IconButton(
                onPressed: () async {
                  state.change();
                },
                icon: Icon(Icons.change_circle))
          ]),
          body: Center(
            child: Text(value.name),
          ),
        );
      }
      print(value);
      print('erro no bagulho');
      throw Exception('erro no bagulho');
    } catch (e) {
      return Center(
        child: Text(e.toString()),
      );
    }
  }
}
