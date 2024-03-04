class User {
  final int userID;
  final String username;

  User({
    required this.userID,
    this.username = "K",
  });

  User.fromJSON(Map<String, dynamic> json)
      : userID = json["id"],
        username = json["username"];

  Map<String, dynamic> toJSON() => {
        "id": userID,
        "username": username,
      };

  @override
  String toString() {
    return '${toJSON()}';
  }
}
