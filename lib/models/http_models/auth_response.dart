
import 'dart:convert';
import '../models.dart';

class AuthResponse {
    AuthResponse({
        required this.user,
        required this.token,
    });

    User user;
    String token;

    factory AuthResponse.fromJson(String str) => AuthResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        user: User.fromMap(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "token": token,
    };
}



