import 'dart:typed_data';

import '../../domain/entities/task.dart' as domain;
import '../protobuf/tasks.pb.dart' as proto;

class TaskAdapter {
  static domain.Task fromProto(Uint8List data) {
    final task = proto.Task();
    task.mergeFromBuffer(data);
    return domain.Task(
      id: task.id,
      task: task.task,
      userId: task.userId,
    );
  }

  static Uint8List toProtoBuffer(domain.Task task) {
    final buffer = proto.Task()
      ..id = task.id
      ..task = task.task
      ..userId = task.userId;

    return buffer.writeToBuffer();
  }
}