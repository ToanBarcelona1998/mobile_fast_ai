import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_profile_state.dart';
import 'my_profile_bloc.dart';
import 'package:flutter/material.dart';

final class MyProfileScreenStatusSelector
    extends BlocSelector<MyProfileBloc, MyProfileState, MyProfileScreenStatus> {
  MyProfileScreenStatusSelector({
    super.key,
    required Widget Function(MyProfileScreenStatus) builder,
  }) : super(
          selector: (state) => state.screenStatus,
          builder: (context, screenStatus) => builder(screenStatus),
        );
}

final class MyProfileUserSelector
    extends BlocSelector<MyProfileBloc, MyProfileState, User?> {
  MyProfileUserSelector({
    super.key,
    required Widget Function(User?) builder,
  }) : super(
          selector: (state) => state.user,
          builder: (context, user) => builder(user),
        );
}
