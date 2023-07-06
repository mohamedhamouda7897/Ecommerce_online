import 'package:e_commerce_online/core/error/failures.dart';
import 'package:e_commerce_online/features/home/data/models/CartReponse.dart';

abstract class CartStates {}

class CartInitStates extends CartStates {}

class CartLoadingStates extends CartStates {}

class CartSuccessStates extends CartStates {
  CartResponse cartResponse;

  CartSuccessStates(this.cartResponse);
}

class CartDeleteSuccessStates extends CartStates {
  CartResponse cartResponse;

  CartDeleteSuccessStates(this.cartResponse);
}

class CartErrorStates extends CartStates {
  Failures failures;

  CartErrorStates(this.failures);
}

class CartDeleteItemErrorStates extends CartStates {
  Failures failures;

  CartDeleteItemErrorStates(this.failures);
}
