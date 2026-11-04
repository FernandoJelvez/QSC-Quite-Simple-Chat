import 'package:quite_simple_chat/domain/entities/chat_type.dart';
import 'package:quite_simple_chat/domain/entities/message.dart';

class Chat {
  String? id;
  String? name;
  String? lastMessage;
  Set<String> members = {};
  String? lastMessenger;
  DateTime? lastTime;
  ChatType? type;
  List<Message> messages = [];


  Chat(this.id, this.name, this.lastMessage, this.members,this.lastMessenger, this.lastTime, this.type, this.messages);

  Chat.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json["id"] as String;
    members = json["members"] as Set<String>;
    lastMessage = json["last_messenger"] as String;
    lastMessenger = json["last_messenger"] as String;
    lastTime = json["last_time"] as DateTime;
    type = json["type"] as ChatType;
    messages = json["messages"] as List<Message>;
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> json = <String,dynamic>{};
    if (id != null) json["id"] = id;
    json["members"] = id;
    if (lastMessage != null) json["last_message"] = lastMessage;
    if (lastMessenger != null) json["last_messenger"] = lastMessenger;
    if (lastTime != null) json["last_time"] = lastTime;
    if (type !=null) json["type"] = type;
    json["messages"] = messages;
    return json;
  }
}