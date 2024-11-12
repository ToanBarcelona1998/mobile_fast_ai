import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

enum SplashStatus {
  loading,
  checkedIn,
  error,
}

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(SplashStatus.loading) SplashStatus status,
    String ?error,
  }) = _SlpashState;
}
