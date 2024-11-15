import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_personal_info_event.freezed.dart';

@freezed
class SignUpPersonalInfoEvent with _$SignUpPersonalInfoEvent{
  const factory SignUpPersonalInfoEvent.onUserNameChange(String userName) = SignUpPersonalInfoEventOnUserNameChange;
  const factory SignUpPersonalInfoEvent.onPhoneNumberChange(String phoneNumber) = SignUpPersonalInfoEventOnPhoneNumberChange;
  const factory SignUpPersonalInfoEvent.onBirthdayChange(String birthday) = SignUpPersonalInfoEventOnBirthdayChange;
  const factory SignUpPersonalInfoEvent.onGenderChange(int gender) = SignUpPersonalInfoEventOnGenderChange;
  const factory SignUpPersonalInfoEvent.onAddressChange(String address) = SignUpPersonalInfoEventOnAddressChange;
  const factory SignUpPersonalInfoEvent.onUploadAvatar(String filePath) = SignUpPersonalInfoEventOnUploadAvatar;
  const factory SignUpPersonalInfoEvent.obSubmit() = SignUpPersonalInfoEventOnSubmit;
}