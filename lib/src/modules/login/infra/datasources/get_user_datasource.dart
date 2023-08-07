import 'dart:typed_data';

abstract class IGetUserDatasource{
  Future<Uint8List> getUser(Uint8List userProto);
}