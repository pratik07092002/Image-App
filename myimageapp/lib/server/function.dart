import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<void> sendImage(File _selectedimage) async{
var request = http.MultipartRequest('POST' , Uri.parse('http://10.0.2.2:5000/upload'));
request.files.add(await http.MultipartFile.fromPath('image', _selectedimage.path));

try {
var response = await request.send().timeout(Duration(seconds: 20));
  if(response.statusCode == 200){
    Fluttertoast.showToast(msg: "Uploaded Successfully");

  }
  else{
    Fluttertoast.showToast(msg: "Unable to Upload");
  }
  
} catch (e) {
  Fluttertoast.showToast(msg: "Error ${e}");
}
}