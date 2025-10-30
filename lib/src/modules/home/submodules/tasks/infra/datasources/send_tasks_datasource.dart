import 'dart:typed_data';

abstract class ISendTasksDatasource{
  Future<String> sendTask(Uint8List taskProto);
}