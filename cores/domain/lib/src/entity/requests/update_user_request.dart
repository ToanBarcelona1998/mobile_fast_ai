final class UpdateUserRequest {
  final String accessToken;
  final String ?name;
  final String? phoneNumber;
  final String? address;
  final String? birthday;
  final String? avatar;
  final int ?gender;

  const UpdateUserRequest({
    required this.accessToken,
    this.name,
    this.gender,
    this.phoneNumber,
    this.birthday,
    this.avatar,
    this.address,
  });

  bool isValidGender(){
    if(gender != null){
      return gender! <=2 && gender! >=0;
    }

    return true;
  }
}
