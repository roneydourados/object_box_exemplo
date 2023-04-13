import 'package:flutter/material.dart';
import 'package:teste_object_box/controllers/owner_controller.dart';
import 'package:teste_object_box/models/owner.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  late final Owner owner;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _addOwner(String name) async {
    context.read<OwnerController>().add(name);
  }

  _allOwners() async {
    context.read<OwnerController>().all();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //_addOwner('Roney Melo');
          _allOwners();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
