import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_confiq/app_colors.dart';
class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(50.h),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context)=>InkWell(
          onTap: (){
            Scaffold.of(context).openDrawer();
          },
          child: Padding(
            padding:  EdgeInsets.only(left: 12.w,top: 12.h),
            child: Container(
              width: 70.w,
              height: 70.h,
              decoration: const BoxDecoration(color: Colors.blue,shape: BoxShape.circle),
              child: Center(
                child: Container(
                  width: 39.w,
                  height: 39.h,
                  decoration: BoxDecoration(color: AppColors.whiteColor,shape: BoxShape.circle),
                  child: Center(child: Icon(Icons.menu,color: AppColors.blueColor),),
                ),
              ),
            ),
          ),
        )),
        title: Container(
          width: 50.w,
          height: 50.h,
          decoration:const BoxDecoration(image: DecorationImage(image: AssetImage("asset/icon/logo.jpg"))),
        ),
        centerTitle: true,
        actions: [
         Padding(
           padding:  EdgeInsets.only(top: 17.h,bottom: 5.h),
           child: ElevatedButton(onPressed: (){}, child: Text("Access",style: TextStyle(color: AppColors.blueColor),),
           style: ElevatedButton.styleFrom(
               backgroundColor: AppColors.whiteColor,
               side: BorderSide(width: 1,color: AppColors.blueColor))),
         ),
          SizedBox(width: 5.w,)
        ],
      ),
    );
  }
}


