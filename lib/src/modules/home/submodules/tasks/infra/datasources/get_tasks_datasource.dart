import 'dart:typed_data';

abstract class IGetTasksDatasource{
  Future<Uint8List> getTasks(String id);
}