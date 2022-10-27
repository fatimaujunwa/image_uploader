import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ImageController extends GetxController{
  late File image;
  PickedFile? pickedFile;
  String? _imagePath;
  String? get imagePath=>_imagePath;
  final _picker=ImagePicker();
  bool _tap=false;
  bool get tap=>_tap;
  bool _loading=false;
  bool get loading=>_loading;


  Future<void>pickImage()async{
    _tap=true;

    pickedFile=await  _picker.getImage(source: ImageSource.gallery);
  update();
  }
  Future<bool>upload()async{
    _loading=true;
    update();
    bool success=false;

    http.StreamedResponse response=await UpdateProfile(pickedFile);

  if(response.statusCode==201){
    Map map=jsonDecode(await response.stream.bytesToString());
    _loading=false;


    success=true;

    _imagePath=map["message"];
  }
  else{

  }
  update();
    return success;
  }
  Future<http.StreamedResponse>UpdateProfile(PickedFile?data)async{
    http.MultipartRequest request =http.MultipartRequest('POST', Uri.parse('https://aws143.arnavgoyal4.repl.co/upload'));
    if(GetPlatform.isMobile && data!=null){

      File _file=File(data.path);
      request.files.add(await http.MultipartFile.fromPath("files[]", data.path));
        // ('image', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last)


    }
    http.StreamedResponse response=await request.send();

    return response;
  }


}