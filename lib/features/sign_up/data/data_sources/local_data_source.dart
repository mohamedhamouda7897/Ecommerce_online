import 'package:dartz/dartz.dart';
import 'package:e_commerce_online/core/error/failures.dart';
import 'package:e_commerce_online/features/sign_up/data/data_sources/sign_sup_data_sources.dart';
import 'package:e_commerce_online/features/sign_up/data/models/SignUpModel.dart';

import '../../domain/entities/user_data.dart';

class LocalDataSource implements SignUpDataSources {
  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
