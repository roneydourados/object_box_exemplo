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
  late final Owner _owner;
  List<Owner> _owners = [];

  _addOwner(String name) async {
    _owner = await context.read<OwnerController>().add(name);

    setState(() {
      _owners.add(_owner);
    });
  }

  _allOwners() async {
    _owners = await context.read<OwnerController>().all();

    setState(() {
      _owners.first;
    });
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
                color: Colors.green,
                height: 50,
                child: Center(
                  child: Text(
                    _owners[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addOwner('Roney Melo');
          //_allOwners();
        },
        tooltip: 'Novo contato',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
