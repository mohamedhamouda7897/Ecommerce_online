import 'package:e_commerce_online/features/cart/data/repositories/cart_data_repo.dart';
import 'package:e_commerce_online/features/cart/domain/repositories/cart_domain_repo.dart';
import 'package:e_commerce_online/features/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:e_commerce_online/features/cart/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/dto.dart';

class CartCubit extends Cubit<CartStates> {
  CartDto cartDto;

  CartCubit(this.cartDto) : super(CartInitStates());

  static CartCubit get(context) => BlocProvider.of(context);

  void update(String id, int count) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.update(id, count);
    result.fold((l) {
      print(l.message);
      emit(CartDeleteItemErrorStates(l));
    }, (r) {
      emit(CartSuccessStates(r));
    });
  }

  void deleteItem(String id) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.delete(id);
    result.fold((l) {
      print(l.message);
      emit(CartDeleteItemErrorStates(l));
    }, (r) {
      emit(CartSuccessStates(r));
    });
  }

  void getCart() async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.call();
    result.fold((l) {
      print(l.message);
      emit(CartErrorStates(l));
    }, (r) {
      emit(CartSuccessStates(r));
    });
  }
}
