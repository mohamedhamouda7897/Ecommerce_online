import 'package:e_commerce_online/core/utils/app_colors.dart';
import 'package:e_commerce_online/features/home/data/data_sources/data_sources.dart';
import 'package:e_commerce_online/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce_online/features/home/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_images.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // LoginEntity loginEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRemoteDto())
        ..getCategories()
        ..getBrands()
        ..getProducts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetProductsErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures.message),
              ),
            );
          }
          if (state is HomeLoadingState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is HomeGetCategoriesSuccessState) {}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Badge(
                    alignment: Alignment.topCenter,
                    label: Text(
                        HomeCubit.get(context).numOfItemsInCart.toString()),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.cart);
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: AppColors.primary,
                        )),
                  ),
                )
              ],
              title: Image.asset(
                AppImages.logo,
                width: 66.w,
                color: AppColors.primary,
                height: 22.h,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: HomeCubit.get(context).bottomNavIndex,
              onTap: (value) {
                HomeCubit.get(context).changeBottomNav(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "",
                    backgroundColor: AppColors.primary),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined),
                    label: "",
                    backgroundColor: AppColors.primary),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: "",
                    backgroundColor: AppColors.primary),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "",
                    backgroundColor: AppColors.primary),
              ],
            ),
            body: HomeCubit.get(context)
                .tabs[HomeCubit.get(context).bottomNavIndex],
          );
        },
      ),
    );
  }
}
