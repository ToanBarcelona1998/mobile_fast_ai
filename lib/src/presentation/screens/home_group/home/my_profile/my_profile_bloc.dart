import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_profile_event.dart';

import 'my_profile_state.dart';

final class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  final UserUseCase _userUseCase;

  MyProfileBloc(this._userUseCase)
      : super(
          const MyProfileState(),
        ){
    on(_onInit);
  }

  void _onInit(
    MyProfileEventOnInit event,
    Emitter<MyProfileState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          screenStatus: MyProfileScreenStatus.loading,
        ),
      );

      final user = await _userUseCase.getStorageUser();

      emit(
        state.copyWith(
          screenStatus: MyProfileScreenStatus.loaded,
          user: user,
        ),
      );
    } catch (e) {
      LogProvider.log('My profile on init error ${e.toString()}');
      emit(
        state.copyWith(
          screenStatus: MyProfileScreenStatus.error,
        ),
      );
    }
  }
}
