import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_global_state.dart';

final class AppGlobalCubit extends Cubit<AppGlobalState> {
  AppGlobalCubit()
      : super(
          const AppGlobalState(),
        );

  void changeStatus(AppGlobalStatus status){
    if(state.status != status){
      emit(state.copyWith(status: status));
    }
  }

  static AppGlobalCubit of(BuildContext context) =>
      BlocProvider.of<AppGlobalCubit>(context);
}
