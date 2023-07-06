import 'package:e_commerce_online/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce_online/features/home/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  ProductDataEntity model;

  ProductItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237.h,
      width: 191.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
              color: const Color(0xff004182).withOpacity(.3), width: 2.w)),
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)),
                child: Image.network(
                  model.imageCover ?? "",
                  height: 128.h,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      model.title ?? "",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff06004F)),
                    ),
                    Text(
                      model.description ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff06004F)),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          model.price.toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: const Color(0xff06004F)),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          (model.price ?? 50 - 50).toString(),
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.lineThrough,
                              decorationColor:
                                  const Color(0xff004182).withOpacity(.6)
                              // Replace with your desired color
                              ,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: const Color(0xff004182).withOpacity(.6)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Review (${model.ratingsAverage})',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: const Color(0xff06004F)),
                        ),
                        Icon(
                          Icons.star,
                          color: const Color(0xffFDD835),
                          size: 15.h,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  // fav = !fav;
                  // setState(() {});
                },
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(Icons.favorite_border),
                    // child: fav
                    //     ? Image.asset('assets/images/Vectorhart_full.png')
                    //     : Image.asset('assets/images/heart.png'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  HomeCubit.get(context).addTCart(model.id ?? "");
                },
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: const Color(0xff004182),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
