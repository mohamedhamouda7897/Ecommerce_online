import 'package:dartz/dartz.dart';
import 'package:e_commerce_online/core/error/failures.dart';
import 'package:e_commerce_online/features/cart/data/data_sources/dto.dart';
import 'package:e_commerce_online/features/cart/domain/repositories/cart_domain_repo.dart';
import 'package:e_commerce_online/features/home/data/models/CartReponse.dart';

class CartDataRepo implements CartDomainRepo {
  CartDto cartDto;

  CartDataRepo(this.cartDto);

  @override
  Future<Either<Failures, CartResponse>> getCart() {
    return cartDto.getCart();
  }

  @override
  Future<Either<Failures, CartResponse>> deleteItemOfCart(String id) {
    return cartDto.deleteItemOfCart(id);
  }

  @override
  Future<Either<Failures, CartResponse>> update(String id, int count) {
    return cartDto.update(id, count);
  }
}
