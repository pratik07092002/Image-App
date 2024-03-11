import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        children: [
          Text("Select and Send Image to desktop through below method using IP address"),
          SizedBox(height: 50,),
        ElevatedButton(onPressed: () {}, child: Text("Select Image")),
          // selected image display 
        SizedBox(height: 30,),
        ElevatedButton(onPressed: () {}, child: Text("Send Image")),

          
      ],)),
    );
  }
}