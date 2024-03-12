import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myimageapp/server/function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? ImageFile;
  String Predicted_char = "";
  Future<void> SelectImage() async{
var picker = ImagePicker();
final pickedimg = await picker.pickImage(source: ImageSource.gallery);

setState(() {
  if (pickedimg != null) {
  ImageFile = File(pickedimg.path);
}
else{
  Fluttertoast.showToast(msg: "no image selected");
}
});
  }

Future<void> _SendImage() async {
  if (ImageFile != null) {
    try {
      String predictedChar = (await sendImage(ImageFile!));

      // Update the state with the predicted character
      setState(() {
        Predicted_char = predictedChar.toString();
      });

    } catch (e) {
      Fluttertoast.showToast(msg: "Error in UI: $e");
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image App" , style: TextStyle(color: Colors.purple),),
        backgroundColor: Colors.black
      ),
      backgroundColor: Colors.black,

      body:  SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Text("Select and Send Image to desktop through below method using IP address" , style: TextStyle(color: Colors.purple.shade200),),
          SizedBox(height: 50,),
        ElevatedButton(onPressed: SelectImage, child: Text("Select Image")),
          // selected image display 
      ImageFile == null ? Text(" NO Image Selected") : Image.file(ImageFile!),
        SizedBox(height: 30,),
        ElevatedButton(onPressed: _SendImage, child: Text("Send Image")),
          
      SizedBox(height: 10,)
      ,
      Text("Output:-: ${Predicted_char}" , style: TextStyle(color: Colors.white),)
          
      ],)),
    );
  }
}