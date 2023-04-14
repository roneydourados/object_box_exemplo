// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:teste_object_box/controllers/owner_controller.dart';
import 'package:teste_object_box/models/owner.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.title});

  late Owner _owner;

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Owner> _owners = [];

  _addOwner(String name) async {
    widget._owner = await context
        .read<OwnerController>()
        .add('${_owners.length + 1} - $name');

    setState(() {
      _owners.add(widget._owner);
    });
  }

  _allOwners() async {
    _owners = await context.read<OwnerController>().all();

    if (_owners.isNotEmpty) {
      setState(() {
        _owners.last;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _allOwners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _owners.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              child: Text(
                _owners[index].name,
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
