// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:teste_object_box/controllers/owner_controller.dart';
import 'package:provider/provider.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final loading = ValueNotifier(true);
  final showOwners = ValueNotifier(false);

  _addOwner(String name) {
    context
        .read<OwnerController>()
        .add('${context.read<OwnerController>().owners.length + 1} - $name');
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getAllOwners();
      loading.value = false;
    });
    showOwners.addListener(getAllOwners);
  }

  Future<void> getAllOwners() async {
    await context.read<OwnerController>().all();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: context.read<OwnerController>().owners.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              child: Text(
                context.read<OwnerController>().owners[index].name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addOwner('Roney Melo');
        },
        tooltip: 'Novo contato',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
