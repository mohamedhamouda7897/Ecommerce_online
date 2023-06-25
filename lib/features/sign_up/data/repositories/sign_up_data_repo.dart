import 'package:dartz/dartz.dart';
import 'package:e_commerce_online/core/error/failures.dart';
import 'package:e_commerce_online/features/sign_up/data/data_sources/sign_sup_data_sources.dart';
import 'package:e_commerce_online/features/sign_up/domain/entities/SignUpEntity.dart';
import 'package:e_commerce_online/features/sign_up/domain/repositories/sign_up_domain_repo.dart';

import '../../domain/entities/user_data.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDataSources sources;

  SignUpDataRepo(this.sources);

  @override
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData) =>
      sources.signUp(userData);
}
