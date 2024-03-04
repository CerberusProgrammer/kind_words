class Chat {
  int id;
  String content;
  String fromUser;
  int fromConnectionID;
  bool read;

  Chat({
    required this.id,
    required this.content,
    required this.fromUser,
    required this.fromConnectionID,
    required this.read,
  });

  Chat.fromJSON(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        fromUser = json["fromUser"],
        fromConnectionID = json["fromConnectionID"],
        read = json["read"];

  Map<String, dynamic> toJSON() => {
        "id": id,
        "content": content,
        "fromUserID": fromUser,
        "fromConnectionID": fromConnectionID,
        "read": read,
      };

  @override
  String toString() {
    return '${toJSON()}';
  }
}
