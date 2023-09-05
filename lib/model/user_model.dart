import 'dart:convert';

import 'package:consumindo_api_flutter/model/user_type.dart';

class UserModel {
  String id;
  String name;
  String username;
  List<UserType> userTypes;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.userTypes,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'username': username});
    result.addAll({'userTypes': userTypes.map((x) => x.toMap()).toList()});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      userTypes: List<UserType>.from(map['userTypes']?.map((x) => UserType.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
