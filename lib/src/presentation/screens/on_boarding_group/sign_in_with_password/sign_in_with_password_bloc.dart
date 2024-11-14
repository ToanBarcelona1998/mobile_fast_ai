import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_with_password_event.dart';
import 'sign_in_with_password_state.dart';

final class SignInWithPasswordBloc
    extends Bloc<SignInWithPasswordEvent, SignInWithPasswordState> {
  final AuthUseCase _authUseCase;

  SignInWithPasswordBloc(this._authUseCase)
      : super(
          const SignInWithPasswordState(),
        );

  void _onPasswordChange(SignInWithPasswordEventOnUserNameChange event){

  }

  void _onUserNameChange(){

  }

  void _onSubmit()async{
    try{
      await _authUseCase.login(state.userName, state.password);
    }catch(e){
      //
    }
  }
}
