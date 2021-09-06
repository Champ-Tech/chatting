import 'package:champteks/UserController.dart';
import 'package:champteks/layout/BottomNavBar.dart';
import 'package:champteks/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final UserController uc = Get.put(UserController());
  final SocketIO socketIO = Get.put(SocketIO());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        title: Text("Champ Teks"),
      ),
      body: Column(
        children: [
          Obx(() => Text('${uc.user.value.name} & ${uc.user.value.age} ')),
          TextField(
            decoration: InputDecoration(labelText: "Name"),
            onChanged: (value) {
              uc.user.value.name = value;
              socketIO.io.value.emit("sendMessage", value);
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Age"),
            onChanged: (value) => {uc.user.value.age = int.parse(value)},
          )
        ],
      ),
    );
  }
}
