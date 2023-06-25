import 'package:dartz/dartz.dart';
import 'package:e_commerce_online/core/error/failures.dart';
import 'package:e_commerce_online/features/sign_up/data/models/SignUpModel.dart';

import '../../domain/entities/user_data.dart';

abstract class SignUpDataSources {
  Future<Either<Failures, SignUpModel>> signUp(UserData userData);
}
