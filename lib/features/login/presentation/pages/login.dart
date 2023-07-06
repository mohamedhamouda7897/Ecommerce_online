import 'dart:convert';

import 'package:e_commerce_online/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/text_styles.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
      if (state is LoginSuccessState) {
        Navigator.pop(context);
        print(json.encode(state.loginEntity.token));
        CacheHelper.saveData(key: "User", value: state.loginEntity.token);
        Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.home,
            arguments: state.loginEntity,
            (route) => false);
      } else if (state is LoginLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            backgroundColor: Colors.transparent,
            title: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                )),
          ),
        );
      } else if (state is LoginErrorState) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(state.failures.message),
          ),
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 91.h,
                  ),
                  Image.asset(
                    AppImages.logo,
                    height: 71.h,
                    width: 237.w,
                  ),
                  SizedBox(
                    height: 86.h,
                  ),
                  Text(
                    AppStrings.welcome,
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    AppStrings.loginHint,
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  defaultFormField(
                      controller: LoginCubit.get(context).emailController,
                      label: "Email",
                      validate: (value) {
                        bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value == null || value.isEmpty || !emailValid) {
                          return "Please Enter valid Email Address";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 32.h,
                  ),
                  defaultFormField(
                      controller: LoginCubit.get(context).passwordController,
                      label: "Password",
                      validate: (value) {
                        return null;
                      },
                      isPassword: true),
                  SizedBox(
                    height: 8.h,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Forget Password ?",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: 56.h,
                  ),
                  Container(
                    height: 64.h,
                    child: ElevatedButton(
                      onPressed: () {
                        LoginCubit.get(context).login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text("Login", style: poppins20W600()),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have an account?",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUp);
                        },
                        child: Text("Create Account",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.white)),
                      )
                    ],
                  )
                ]),
          ),
        ),
      );
    });
  }
}
