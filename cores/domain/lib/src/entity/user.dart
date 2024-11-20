final class User {
  final int id;
  final String name;
  final String? phoneNumber;
  final String? address;
  final String? birthday;
  final String? avatar;
  final int gender;

  const User({
    required this.id,
    required this.name,
    required this.gender,
    this.address,
    this.avatar,
    this.birthday,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phoneNumber,
      'address': address,
      'birthday': birthday,
      'avatar': avatar,
      'gender': gender,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      address: json['address'],
      phoneNumber: json['phone'],
      avatar: json['avatar'],
      birthday: json['birthday'],
    );
  }
}
