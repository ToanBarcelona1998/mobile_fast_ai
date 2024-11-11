import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_global_state.freezed.dart';

enum AppGlobalStatus {
  authorized,
  unauthorized,
}

@freezed
class AppGlobalState with _$AppGlobalState {
  const factory AppGlobalState({
    @Default(AppGlobalStatus.unauthorized) AppGlobalStatus status,
  }) = _AppGlobalState;
}
