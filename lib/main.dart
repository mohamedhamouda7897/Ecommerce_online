import 'package:bloc/bloc.dart';
import 'package:e_commerce_online/app.dart';
import 'package:flutter/material.dart';

import 'core/utils/observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
