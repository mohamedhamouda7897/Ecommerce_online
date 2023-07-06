import 'package:dartz/dartz.dart';
import 'package:e_commerce_online/core/error/failures.dart';
import 'package:e_commerce_online/features/home/data/models/CartReponse.dart';
import 'package:e_commerce_online/features/home/domain/entities/CategoriesEntity.dart';
import 'package:e_commerce_online/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce_online/features/home/domain/repositories/home_domain_repo.dart';

import '../data_sources/data_sources.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo(this.homeDataSources);

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands() {
    return homeDataSources.getBrands();
  }

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories() {
    return homeDataSources.getCategories();
  }

  @override
  Future<Either<Failures, ProductEntity>> getProducts() {
    return homeDataSources.getProducts();
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) {
    return homeDataSources.addToCart(productId);
  }
}
