import 'dart:typed_data';

abstract class ISendUserDatasource{
  Future<String> sendUser(Uint8List userProto);
}