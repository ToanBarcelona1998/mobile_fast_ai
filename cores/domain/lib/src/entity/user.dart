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
}
