class Space {
  String? id;
  String? name;
  String? lastMessage;
  Set<String> members = {};
  String? lastMessenger;
  DateTime? lastTime;
  String? description;

  Space(this.id, this.name, this.lastMessage, this.members, this.lastMessenger,
      this.lastTime, this.description);
}