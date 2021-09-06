import 'package:dash_chat/dash_chat.dart';
import 'package:get/get.dart';

import 'Message.dart';

class MessageController extends GetxController {
  final messages = [].obs;

  addMessage(Message msg) {
    messages.add(ChatMessage(
        text: msg.text, user: ChatUser(name: msg.user.name, uid: msg.user.id)));
  }
}
