import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_state.dart';

final class SplashCubit extends Cubit<SplashState> {
  final UserUseCase _userUseCase;

  SplashCubit(this._userUseCase) : super(const SplashState());

  void starting() async {
    emit(
      state.copyWith(
        status: SplashStatus.loading,
      ),
    );

    try {
      await _userUseCase.getUser();

      emit(
        state.copyWith(
          status: SplashStatus.checkedIn,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SplashStatus.error,
        ),
      );
    }
  }
}
