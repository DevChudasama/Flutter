import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.firstname,
    required this.lastname,
    required this.age,
    this.id,
  });

  String firstname;
  String lastname;
  int age;
  String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["Firstname"],
        lastname: json["Lastname"],
        age: json["Age"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Firstname": firstname,
        "Lastname": lastname,
        "Age": age,
        "id": id,
      };
}
