final class UpdateUserRequest {
  final String name;
  final String? phoneNumber;
  final String? address;
  final String? birthday;
  final String? avatar;
  final int gender;

  const UpdateUserRequest({
    required this.name,
    required this.gender,
    this.phoneNumber,
    this.birthday,
    this.avatar,
    this.address,
  });

  bool isValidGender(){
    return gender <=2 && gender >=0;
  }
}