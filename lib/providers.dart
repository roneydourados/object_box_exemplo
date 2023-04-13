// ignore_for_file: depend_on_referenced_packages

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:teste_object_box/controllers/owner_controller.dart';
import 'package:teste_object_box/controllers/task_controller.dart';
import 'package:teste_object_box/database/database.dart';

final providers = <SingleChildWidget>[
  Provider<Database>(
    create: (context) => Database(),
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
