import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/store/counter_store.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class CounterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => io.io('http://localhost:5000/counter',
      io.OptionBuilder().setTransports(['websocket']).build())),
    Bind.singleton((i) => CounterStore(i()))
  ];

  @override
  final List<ModularRoute> routes = [
  ];
}
