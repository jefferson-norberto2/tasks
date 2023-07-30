import 'dart:typed_data';
import '../protobuf/user.pb.dart' as proto;
import '../../domain/entities/user.dart' as domain;

class UserAdapter {
  static domain.User fromProto(dynamic data){
    final user = proto.User();
    user.mergeFromBuffer(data);
    return domain.User(
      id: user.id,
      name: user.name,
      password: user.password,
    );
  }

  static Uint8List toProtoBuffer(domain.User user){
    final id = user.id ?? "0";

    final buffer = proto.User()
      ..id = id
      ..name = user.name
      ..password = user.password;

    return buffer.writeToBuffer();
  }
}