import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int userId;
  final String firstName;
  final String lastName;
  final String avatarUrl;
  final String emailId;
  const UserModel({
    this.userId = 0,
    this.firstName = '',
    this.lastName = '',
    this.avatarUrl = '',
    this.emailId = '',
  });

  UserModel copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    String? emailId,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      emailId: emailId ?? this.emailId,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['id']?.toInt() ?? 0,
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      avatarUrl: map['avatar'] ?? '',
      emailId: map['email'] ?? '',
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'userModel(userId: $userId, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, emailId: $emailId)';
  }

  @override
  List<Object> get props {
    return [
      userId,
      firstName,
      lastName,
      avatarUrl,
      emailId,
    ];
  }
}
