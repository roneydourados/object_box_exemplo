import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:teste_object_box/controllers/owner_controller.dart';
import 'package:teste_object_box/controllers/task_controller.dart';
import 'package:teste_object_box/database/objectbox_database.dart';

final providers = <SingleChildWidget>[
  Provider<ObjectBoxDatabase>(
    create: (context) => ObjectBoxDatabase(),
  ),
  ChangeNotifierProvider<OwnerController>(
    create: (context) => OwnerController(
      context.read(),
    ),
  ),
  ChangeNotifierProvider<TaskController>(
    create: (context) => TaskController(
      context.read(),
    ),
  ),
];
