import 'package:e_commerce_online/core/utils/app_images.dart';
import 'package:e_commerce_online/features/home/data/data_sources/data_sources.dart';
import 'package:e_commerce_online/features/home/data/repositories/home_data_repo.dart';
import 'package:e_commerce_online/features/home/domain/entities/CategoriesEntity.dart';
import 'package:e_commerce_online/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce_online/features/home/domain/repositories/home_domain_repo.dart';
import 'package:e_commerce_online/features/home/domain/use_cases/add_cart_use_case.dart';
import 'package:e_commerce_online/features/home/domain/use_cases/get_brands_use_case.dart';
import 'package:e_commerce_online/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce_online/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:e_commerce_online/features/home/presentation/manager/states.dart';
import 'package:e_commerce_online/features/home/presentation/pages/tabs/category_tab.dart';
import 'package:e_commerce_online/features/home/presentation/pages/tabs/fav_tab.dart';
import 'package:e_commerce_online/features/home/presentation/pages/tabs/home_tab.dart';
import 'package:e_commerce_online/features/home/presentation/pages/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit(this.homeDataSources) : super(HomeInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;
  int numOfItemsInCart = 0;
  List<Widget> tabs = const [HomeTab(), CategoryTab(), FavTab(), ProfileTab()];

  List<DataEntity> categories = [];
  List<DataEntity> brands = [];
  List<ProductDataEntity> products = [];

  List<String> sliders = [
    AppImages.slider1,
    AppImages.slider2,
    AppImages.slider3
  ];

  void changeBottomNav(int index) {
    emit(HomeInitState());
    bottomNavIndex = index;
    emit(ChangeBottomNavBar());
  }

  void addTCart(String productId) async {
    emit(AddToCartLoadingState());
    AddCartUseCase addCartUseCase = AddCartUseCase(homeDomainRepo);
    var result = await addCartUseCase.call(productId);
    result.fold((l) {
      emit(AddToCartErrorState(l));
    }, (r) {
      numOfItemsInCart = r.numOfCartItems ?? 0;
      emit(AddToCartSuccessState(r));
    });
  }

  getProducts() async {
    emit(HomeLoadingState());
    GetProductsUseCase productsUseCase = GetProductsUseCase(homeDomainRepo);
    var result = await productsUseCase.call();
    result.fold((l) {
      emit(HomeGetProductsErrorState(l));
    }, (r) {
      products = r.data ?? [];
      print(products.length.toString());
      emit(HomeGetProductsSuccessState(r));
    });
  }

  getBrands() async {
    emit(HomeLoadingState());
    GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeDomainRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) {
      emit(HomeGetBrandsErrorState(l));
    }, (r) {
      brands = r.data ?? [];
      emit(HomeGetBrandsSuccessState(r));
    });
  }

  getCategories() async {
    emit(HomeLoadingState());
    GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesUseCase(homeDomainRepo);
    var result = await getCategoriesUseCase.call();
    result.fold((l) {
      emit(HomeGetCategoriesErrorState(l));
    }, (r) {
      categories = r.data ?? [];
      emit(HomeGetCategoriesSuccessState(r));
    });
  }
}
