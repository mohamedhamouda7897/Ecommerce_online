import 'package:e_commerce_online/core/error/failures.dart';

import '../../domain/entities/login_entity.dart';

abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginEntity loginEntity;

  LoginSuccessState(this.loginEntity);
}

class LoginErrorState extends LoginStates {
  Failures failures;

  LoginErrorState(this.failures);
}
