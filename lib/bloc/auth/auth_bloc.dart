import 'package:bloc/bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/auth/auth_events.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/auth/auth_state.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/auth/user_repository.dart';
import 'package:flutter_demo_bloc_grahpql/models/auth_request.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthRepository _authRepository;

  AuthBloc() {
    _authRepository = AuthRepository();
  }

  AuthRequest _authRequest;

  @override
  AuthState get initialState => AuthState();

  void authenticateUser(AuthRequest authRequest) {
    print("Trying to call event");
    _authRequest = authRequest;
    this.add(AuthEvents.authenticateUser);
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvents event) async* {
    switch (event) {
      case AuthEvents.authenticateUser:
        yield AuthState(isSaving: true, isSaved: false);
        bool isSuccessful =
            await _authRepository.authenticatedUser(_authRequest);
        yield AuthState(
            isSaving: false, isSaved: isSuccessful, hasFailure: !isSuccessful);
        break;
    }
  }
}
