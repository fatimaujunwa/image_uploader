import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_uploader/widgets/black_container.dart';
import 'package:image_uploader/widgets/custom_snack_bar.dart';
import 'dart:io';

import 'package:image_uploader/controllers/image_controller.dart';
import 'package:image_uploader/utils/text_dimensions.dart';
import 'package:image_uploader/utils/themes.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ImageController());
    return ScreenUtilInit(
      builder: (context, _) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          home: const Home(),
        );
      },
      designSize: Size(416, 896),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _switchValue=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

        body: GetBuilder<ImageController>(
      builder: (controller) {
        return Column(
          children: [

            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 60.h),
                  margin: EdgeInsets.only(
                    left: 30.w,
                  ),
                  height: 750.h,
                  width: 500.w,
                ),

                Positioned(
                    top: 130.h,
                    child: Container(
                        height: 614.h,
                        width: 345.w,
                        margin: EdgeInsets.only(left: 35.w),
                        decoration: BoxDecoration(
                      color:   Theme.of(context).bottomAppBarColor,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(0, 3),
                                color: Theme.of(context).cardColor)
                          ],
                        ),
                        child: controller.pickedFile != null
                            ? GestureDetector(
                                onTap: () {
                                  controller.pickImage();
                                },
                                child: Image.file(
                                  File(controller.pickedFile!.path),
                                  width: 100.w,
                                  height: 100.h,
                                  fit: BoxFit.cover,
                                ))
                            : Container(
                                margin: EdgeInsets.only(
                                    top: 30.h,
                                    right: 30.w,
                                    bottom: 30.h,
                                    left: 30.w),
                                child: DottedBorder(
                                  color: Colors.grey.withOpacity(0.5),
                                  strokeWidth: 1,
                                  child: Center(
                                      child: GestureDetector(
                                    onTap: () {
                                      controller.pickImage();
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.image,
                                            color: Colors.grey.withOpacity(0.5),
                                            size: 70.h,
                                          ),
                                          Text(
                                            'Click to select image',
                                            style: TextDimension.style4,
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                                ),
                              ))),
                Positioned(
                    // left: Dimensions.width56,
                    child: Container(

                  height: 200.h,
                  width: 400.w,
                  margin: EdgeInsets.only(left: 50.w, top: 20.h),
                  child: Row(
                    children: [
                      Text(
                        "U",
                        style: TextDimension.style1.copyWith(color: Theme.of(context).dividerColor),
                      ),
                      Text(
                        "p",
                        style: TextDimension.style1.copyWith(color: Theme.of(context).dividerColor),
                      ),
                      // SizedBox(
                      //   width: 120.w,
                      // ),
                      Text(
                        "l",
                        style: TextDimension.style1.copyWith(color: Theme.of(context).dividerColor),
                      ),
                      Text(
                        "o",
                        style: TextDimension.style1.copyWith(color: Theme.of(context).dividerColor),
                      ),
                      Text(
                        "a",
                        style: TextDimension.style1.copyWith(color: Theme.of(context).dividerColor),
                      ),
                      Text(
                        "d",
                        style: TextDimension.style1.copyWith(color: Theme.of(context).dividerColor),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            GestureDetector(
              onTap: (){
                print(controller.loading);
                controller.upload()..then((value) {
                  if(value==true){
                    print(controller.loading);
                    showCustomSnackBar(controller.imagePath!, "image upload");
                  }
                  else{
                    showCustomSnackBar("Unfortunately we were unable to upload your image, please try again", "image upload");
                  }
                });
                print(controller.imagePath);
              },

              child:controller.loading==true?CircularProgressIndicator(color: Colors.black,):
              BlackContainer(),
            ),
            SizedBox(height: 10.h,),
            CupertinoSwitch(
              value: _switchValue,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                  Get.changeThemeMode(Get.isDarkMode? ThemeMode.light:ThemeMode.dark);
                });
              },
            ),

          ],
        );
      },
    ));
  }
}


