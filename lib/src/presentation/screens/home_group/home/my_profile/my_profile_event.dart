import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_profile_event.freezed.dart';

@freezed
class MyProfileEvent with _$MyProfileEvent{
  const factory MyProfileEvent.onInit() = MyProfileEventOnInit;
}