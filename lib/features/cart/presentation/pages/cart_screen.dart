import 'package:e_commerce_online/core/utils/app_colors.dart';
import 'package:e_commerce_online/features/cart/data/data_sources/dto.dart';
import 'package:e_commerce_online/features/cart/presentation/manager/cubit.dart';
import 'package:e_commerce_online/features/cart/presentation/manager/states.dart';
import 'package:e_commerce_online/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(RemoteCartDto())..getCart(),
      child: BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CartSuccessStates) {
            return Scaffold(
              bottomNavigationBar: Container(
                height: 70.h,
                color: Colors.greenAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price"),
                        Text("${state.cartResponse.data?.totalCartPrice} EGP")
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary),
                        onPressed: () {},
                        child: Text("Check Out"))
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CartItem(
                            state.cartResponse.data!.products![index]);
                      },
                      itemCount: state.cartResponse.numOfCartItems,
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
