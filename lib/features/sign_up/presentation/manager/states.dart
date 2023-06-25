import 'package:e_commerce_online/core/error/failures.dart';
import 'package:e_commerce_online/features/sign_up/domain/entities/SignUpEntity.dart';

abstract class SignUpStates {}

class SignUpInitState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  SignUpEntity signUpEntity;

  SignUpSuccessState(this.signUpEntity);
}

class SignUpErrorState extends SignUpStates {
  Failures failures;

  SignUpErrorState(this.failures);
}
