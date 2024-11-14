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
      await Future.delayed(const Duration(seconds: 2));
      await _userUseCase.getUser();

      emit(
        state.copyWith(
          status: SplashStatus.checkedIn,
        ),
      );
    } catch (e) {
      LogProvider.log('Splash screen: ${e.toString()}');
      emit(
        state.copyWith(
          status: SplashStatus.error,
          error: e.toString()
        ),
      );
    }
  }
}
