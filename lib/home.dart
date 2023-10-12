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
                  await state.logout();
                },
                icon: Icon(Icons.logout)),
          ]),
          body: Center(
            child: Column(
              children: [
                Text(value.name),
                const SizedBox(height: 20),
                FloatingActionButton.extended(
                  onPressed: () async {
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Third()));
                  },
                  label: const Text('Proxima pagina'),
                )
              ],
            ),
          ),
        );
      }
      throw Exception('erro no bagulho');
    } catch (e) {
      return Center(
        child: Text(e.toString()),
      );
    }
  }
}
