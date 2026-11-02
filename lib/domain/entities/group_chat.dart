class GroupChat {
  String? name;
  String? lastMessage;
  List<String> members = [];
  String? lastMessenger;
  DateTime? lastTime;


  GroupChat(this.name, this.lastMessage, this.members, this.lastMessenger,
      this.lastTime);

  GroupChat.fromJson(Map<String,dynamic>? json) {
    if (json == null) return;
    name = json["name"] as String;
    lastMessage = json["last_message"] as String;
    members = json["members"] as List<String>;
    lastMessenger = json["last_messenger"];
    lastTime = json["last_time"] as DateTime;
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> json = <String, dynamic>{};
    if (name != null) json["name"] = name;
    if (lastMessage != null) json["last_message"] = lastMessage;
    if (members.isNotEmpty) json["members"] = members;
    if (lastMessenger != null) json["last_messenger"] = lastMessenger;
    if (lastTime != null) json["last_time"] = lastTime;
    return json;
  }
}