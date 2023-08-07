import 'dart:typed_data';

import 'package:tasks/src/modules/tasks/domain/entities/user.dart' as domain;
import 'package:tasks/src/modules/tasks/infra/protobuf/tasks.pb.dart' as proto;

import '../../domain/entities/task.dart';

class UserAdapter{
  static domain.User fromProto(Uint8List data){
    final user = proto.User();
    user.mergeFromBuffer(data);
    final List<Task> list = user.tasks.map((task) => Task(
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