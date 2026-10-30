class DmChat {
  String? name;
  String? lastMessage;
  DateTime? lastTime;

  DmChat({this.name, this.lastMessage,this.lastTime});

  DmChat.fromJson(Map<String,dynamic>? json) {
    if (json == null) return;
    name = json["name"] as String;
    lastMessage = json["last_message"] as String;
    lastTime = json["last_time"] as DateTime;
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> json = <String, dynamic>{};
    if (name != null) json["name"] = name;
    if (lastMessage != null) json["last_message"] = lastMessage;
    if (lastTime != null) json["last_time"] = lastTime;
    return json;
  }
}