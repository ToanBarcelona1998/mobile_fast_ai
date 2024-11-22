import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_profile_state.freezed.dart';

enum MyProfileScreenStatus {
  loading,
  loaded,
  error,
}

@freezed
class MyProfileState with _$MyProfileState {
  const factory MyProfileState({
    @Default(MyProfileScreenStatus.loading) MyProfileScreenStatus screenStatus,
    User ?user,
  }) = _MyProfileState;
}
