import 'package:champteks/MessageController.dart';
import 'package:champteks/Received.dart';
import 'package:champteks/layout/BottomNavBar.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../main.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late final SocketIO socketIO;

  final MessageController messages = Get.put(MessageController());

  final List<ChatMessage> messageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
          title: Text("Champ Teks"),
        ),
        body: Column(children: [
          Expanded(
            child: DashChat(
              parsePatterns: <MatchText>[
                MatchText(type: ParsedType.EMAIL, onTap: (String value) {}),
                MatchText(
                    pattern: r"\B#+([\w]+)\b",
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 24,
                    ),
                    onTap: (String value) {}),
              ],
              onSend: (message) {
                socketIO.io.value.emit("sendMessage", message.text);
                setState(() {
                  messageList.add(ChatMessage(
                      text: message.text,
                      user: ChatUser(
                          uid: message.user.uid, name: message.user.name)));
                });
              },
              user: ChatUser(
                name: "Brinta",
                uid: "brinta",
              ),
              messages: messageList,
            ),
          )
        ]));
  }

  @override
  void initState() {
    socketIO = Get.find();
    super.initState();
    socketIO.io.value.on('receiveMessage', (data) {
      Received r = Received.fromJson(Map.from(data));
      Received(msg: "5");

      setState(() {
        messageList.add(ChatMessage(
            text: r.msg, user: ChatUser(uid: "farhan", name: "farhan")));
      });
      print(messageList.length);
      /*messages.addMessage(
          Message(txt: data.msg, userID: "farhan", username: "farhan"));*/
    });
  }
}
