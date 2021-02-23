import 'package:flutter_demo_bloc_grahpql/models/auth_request.dart';

class AuthState {
  AuthRequest authRequest;
  bool isLoading;
  bool isLoaded;
  bool isSaved;
  bool hasFailure;
  bool isSaving;

  AuthState({
    this.authRequest,
    this.isLoading = false,
    this.isSaved = false,
    this.isSaving = false,
    this.hasFailure = false,
    this.isLoaded = false,
  });
}