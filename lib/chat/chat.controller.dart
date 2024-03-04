import 'package:get/get.dart';
import 'package:kind_words/chat/chat.model.dart';

class ChatController extends GetxController {
  var chats = [
    Chat(
      id: 0,
      content: 'Hola',
      fromUser: 'A',
      fromConnectionID: 0,
      read: false,
    ),
    Chat(
      id: 0,
      content: 'Hola',
      fromUser: 'B',
      fromConnectionID: 0,
      read: true,
    ),
  ].obs;

  List<Chat> getChats() {
    return chats;
  }
}
