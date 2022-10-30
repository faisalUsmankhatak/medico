import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widget/app_bar.dart';
import '../widget/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Future<QuerySnapshot<Map<String, dynamic>>>   collectionReference= FirebaseFirestore.instance.collection("quiz").get();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          drawer: MyDrawer(),
          //appBar: MyAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                MyAppBar(),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: Get.width,
                  height: 5.h,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.blue, Colors.green])),

                ),
                SizedBox(
                  height: 5.h,
                ),
                Text("data"),
                SizedBox(
                  height: 10.h,
                ),

FutureBuilder<QuerySnapshot>(
    future: collectionReference,
    builder: (context,shnapshot){
  if(shnapshot.connectionState==ConnectionState.waiting){
    return Center(child: CircularProgressIndicator(),);
  }if(shnapshot.hasError){
    return Text(shnapshot.error.toString());
  }
 return  GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: shnapshot.data!.docs.length,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (170.w / 162.h),
        crossAxisSpacing: 12.h,
        mainAxisSpacing: 12.w,
      ),
      itemBuilder: (context, index) {
        return gridViewTitle(shnapshot.data!.docs![index]['quizName']);
      });
}),

              ],
            ),
          ),
        ));
  }

  Widget gridViewTitle(String quizName) {

    return Container(
      decoration: BoxDecoration(
          color: Colors.cyan, borderRadius: BorderRadius.circular(10.w)),
      child: Stack(
          children: [

      Padding(
      padding: EdgeInsets.only(top: 70.h, left: 48.w),
      child: Text(quizName, style: TextStyle(fontSize: 18.sp),),
    ),
    Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
    height: 30.h,
    color: Colors.blueGrey,
   child: Row(
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [

    Text("10 Qestion"),
    Text("Start Quiz"),
    ]
    ),
    ),)

    ]
    ,
    )
    ,
    );

  }
}
