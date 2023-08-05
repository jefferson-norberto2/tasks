import 'dart:typed_data';
import '../../domain/entities/user.dart' as domain;
import '../protobuf/tasks.pb.dart' as proto;
import '../../domain/entities/task.dart' as entities;

class UserAdapter{
  static domain.User fromProto(Uint8List data){
    final user = proto.User();
    user.mergeFromBuffer(data);
    final List<entities.Task> list = user.tasks.map((task) => entities.Task(
      id: task.id,
      task: task.task,
      userId: task.userId,
    )).toList();
    return domain.User(
      id: user.id,
      name: user.name,
      tasks: list,
    );
  }

  static toProtoBuffer(dynamic data){
    return data;
  }
}