import 'package:socket_io_client/socket_io_client.dart';

const urlSocket = 'http://localhost:5001/tasks';
final optionBuilder = OptionBuilder().setTransports(['websocket']).build();