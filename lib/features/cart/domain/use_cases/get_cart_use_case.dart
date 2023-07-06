import 'package:dartz/dartz.dart';
import 'package:e_commerce_online/core/error/failures.dart';
import 'package:e_commerce_online/features/home/data/models/CartReponse.dart';

import '../repositories/cart_domain_repo.dart';

class CartUseCase {
  CartDomainRepo cartDomainRepo;

  CartUseCase(this.cartDomainRepo);

  Future<Either<Failures, CartResponse>> call() => cartDomainRepo.getCart();

  Future<Either<Failures, CartResponse>> update(String id, int count) =>
      cartDomainRepo.update(id, count);

  Future<Either<Failures, CartResponse>> delete(String id) =>
      cartDomainRepo.deleteItemOfCart(id);
}
