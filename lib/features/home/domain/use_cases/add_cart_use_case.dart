import 'package:dartz/dartz.dart';
import 'package:e_commerce_online/core/error/failures.dart';
import 'package:e_commerce_online/features/home/domain/repositories/home_domain_repo.dart';

import '../../data/models/CartReponse.dart';

class AddCartUseCase {
  HomeDomainRepo homeDomainRepo;

  AddCartUseCase(this.homeDomainRepo);

  Future<Either<Failures, CartResponse>> call(String productId) =>
      homeDomainRepo.addToCart(productId);
}
