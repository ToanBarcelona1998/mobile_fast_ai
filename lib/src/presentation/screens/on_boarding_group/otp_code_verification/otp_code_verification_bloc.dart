import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_code_verification_event.dart';
import 'otp_code_verification_state.dart';

final class OtpCodeVerificationBloc
    extends Bloc<OtpCodeVerificationEvent, OtpCodeVerificationState> {
  final AuthUseCase _authUseCase;

  OtpCodeVerificationBloc(
    this._authUseCase, {
    required String email,
  }) : super(
          OtpCodeVerificationState(
            email: email,
          ),
        ) {
    on(_onChangeOtpCode);
    on(_onConfirm);
    on(_onDeleteOtp);
  }

  void _onChangeOtpCode(
    OtpCodeVerificationOnChangeCodeEvent event,
    Emitter<OtpCodeVerificationState> emit,
  ) {
    final int currentLength = state.codes.length;

    if (currentLength >= 6) return;

    print(currentLength);

    emit(
      state.copyWith(
        codes: [...state.codes, event.otp],
      ),
    );

    if(currentLength == 5){
      add(
        const OtpCodeVerificationOnSubmitEvent(),
      );
    }
  }

  void _onDeleteOtp(
    OtpCodeVerificationOnDeleteEvent event,
    Emitter<OtpCodeVerificationState> emit,
  ) {
    if (state.codes.isEmpty) return;

    final List<String> codes = List.empty(growable: true)..addAll(state.codes);

    codes.removeLast();

    emit(
      state.copyWith(
        codes: codes,
      ),
    );
  }

  void _onResend() async {

  }

  void _onConfirm(
    OtpCodeVerificationOnSubmitEvent event,
    Emitter<OtpCodeVerificationState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: OtpCodeVerificationStatus.checking,
        ),
      );

      await _authUseCase.verifyEmail(
        state.email,
        state.codes.join(),
      );

      emit(
        state.copyWith(
          status: OtpCodeVerificationStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: OtpCodeVerificationStatus.failed,
          error: e.toString(),
        ),
      );
    }
  }
}
