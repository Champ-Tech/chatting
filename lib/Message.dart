import 'package:champteks/User.dart';

class Message {
  late User user;
  late String text;

  Message({username = "", userID = "", txt = "", userImage = ""}) {
    user = User(age: 0, id: userID, image: userImage, name: username);
    text = txt;
  }
}
