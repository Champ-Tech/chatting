import 'package:champteks/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

main() {
  runApp(MyApp());
}

class SocketIO extends GetxController {
  final io = IO
      .io('http://192.168.31.10:5088', IO.OptionBuilder()
      .setPath("/io")
      .setTransports(['websocket'])
      .build())
      .obs;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    IO.Socket socket = SocketIO().io.value;

    socket.onConnect((_) {
      print('connect');
    });
    socket.onError((_) {
      print(_);
    });
    socket.onDisconnect((_) => print('disconnect'));
    super.initState();
  }
}
