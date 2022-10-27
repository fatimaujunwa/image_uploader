import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_uploader/custom_snack_bar.dart';
import 'dart:io';

import 'package:image_uploader/image_controller.dart';
import 'package:image_uploader/text_dimensions.dart';
import 'package:image_uploader/themes.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late File image;
  PickedFile? pickedFile;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile!.path);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ImageController>().upload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<ImageController>(
      builder: (imageController) {
        return SafeArea(
            child: Padding(
          padding: EdgeInsets.all(35),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () => imageController.pickImage(),
                  child: Text('Select an Image'),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey.withOpacity(0.6),
                  child: pickedFile != null
                      ? Image.file(
                          File(imageController.pickedFile!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : Container()),
              SizedBox(
                height: 35.h,
              ),
              Center(
                child: GestureDetector(

                  onTap: () => imageController.upload().then((value) {

                  }),
                  child: Text('Upload Server'),
                ),
              ),
              Text(imageController.imagePath.toString()),
              SizedBox(
                height: 45,
              ),
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey.withOpacity(0.6),
                  child: imageController.imagePath != null
                      ? Image.file(
                          File(imageController.pickedFile!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : Container()),
            ],
          ),
        ));
      },
    ));
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                Container(
                  height: 147.h,
                  width: 320.w,
                  margin: EdgeInsets.only(left: 20.w, top: 20.h),
                  child: Row(
                    children: [
                      Text('U', style: TextDimension.style1),
                      SizedBox(
                        width: 80.w,
                      ),
                      Text('o', style: TextDimension.style1),
                      Text('a', style: TextDimension.style1),
                    ],
                  ),
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
                                            size: 70,
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
                  height: 147.h,
                  width: 320.w,
                  margin: EdgeInsets.only(left: 80.w, top: 20.h),
                  child: Row(
                    children: [
                      Text(
                        "p",
                        style: TextDimension.style1,
                      ),
                      Text(
                        "l",
                        style: TextDimension.style1,
                      ),
                      SizedBox(
                        width: 120.w,
                      ),
                      Text(
                        "d",
                        style: TextDimension.style1,
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
                });
                print(controller.imagePath);
              },

              child: Container(
                height: 41.h,
                width: 300.w,
                margin: EdgeInsets.only(top: 20.h),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff121215),
                      Color(0xff1c1c21),
                    ], begin: Alignment.center, end: Alignment.bottomLeft),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Center(
                    child: Text(
                  'Upload To Server',
                  style: TextDimension.style2,
                )),
              ),
            ),
            GestureDetector(
              onTap: (){

          Get.changeThemeMode(Get.isDarkMode?ThemeMode.dark:ThemeMode.light);
              },

              child: Container(
               child: MaterialButton(onPressed: (){
                 Get.changeThemeMode(Get.isDarkMode? ThemeMode.light:ThemeMode.dark);
               },
               child: Text('change theme'),
               ),

              ),
            ),
          ],
        );
      },
    ));
  }
}
