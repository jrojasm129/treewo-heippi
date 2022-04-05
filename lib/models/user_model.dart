import 'dart:convert';

class User {
    User({
        required this.name,
        required this.email,
        this.picture,
        required this.uid,
    });

    String name;
    String email;
    String? picture;
    String uid;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        picture: json["picture"],
        uid: json["uid"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "picture": picture,
        "uid": uid,
    };
}