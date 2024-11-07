import 'package:domain/domain.dart';

extension UserDtoMapper on UserDto {
  User get toEntity => User(
        id: id,
        name: name,
        gender: gender,
        phoneNumber: phoneNumber,
        birthday: birthday,
        avatar: avatar,
        address: address,
      );
}

final class UserDto {
  final int id;
  final String name;
  final String? phoneNumber;
  final String? address;
  final String? birthday;
  final String? avatar;
  final int gender;

  const UserDto({
    required this.id,
    required this.name,
    required this.gender,
    this.address,
    this.avatar,
    this.birthday,
    this.phoneNumber,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      name: json['userName'],
      gender: json['gender'],
      address: json['address'],
      avatar: json['avatar'],
      birthday: json['birthday'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
