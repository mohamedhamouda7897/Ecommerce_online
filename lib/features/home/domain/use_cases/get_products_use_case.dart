import 'package:dartz/dartz.dart';
import 'package:e_commerce_online/core/error/failures.dart';
import 'package:e_commerce_online/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce_online/features/home/domain/repositories/home_domain_repo.dart';

class GetProductsUseCase {
  HomeDomainRepo homeDomainRepo;

  GetProductsUseCase(this.homeDomainRepo);

  Future<Either<Failures, ProductEntity>> call() =>
      homeDomainRepo.getProducts();
}
