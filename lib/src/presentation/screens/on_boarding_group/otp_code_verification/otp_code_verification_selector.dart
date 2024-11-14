import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_code_verification_bloc.dart';
import 'otp_code_verification_state.dart';

final class OtpCodeVerificationCodesSelector extends BlocSelector<
    OtpCodeVerificationBloc, OtpCodeVerificationState, List<String>> {
  OtpCodeVerificationCodesSelector({
    super.key,
    required Widget Function(List<String>) builder,
  }) : super(
          selector: (state) => state.codes,
          builder: (context, codes) => builder(codes),
        );
}
