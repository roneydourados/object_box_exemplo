import 'package:objectbox/objectbox.dart';
import 'package:teste_object_box/models/owner.dart';

@Entity()
class Task {
  @Id()
  int id;

  String text;

  bool status;

  Task(this.text, {this.id = 0, this.status = false});

  //relação de um owner para uma tarefa
  final owner = ToOne<Owner>();

  bool setFinished() {
    status = !status;
    return status;
  }
}
