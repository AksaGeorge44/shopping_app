//import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File?image;

  void takePicture()async{
 XFile?value= await ImagePicker().pickImage(source: ImageSource.gallery);

 if(value!=null){
   setState(() {
     image= File(value.path);
   });

 }

  }
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile",style: TextStyle(color: Colors.black),),
      ),


      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CupertinoButton(
              onPressed: (){
                takePicture();

              },
              child: CircleAvatar(
                radius: 70,
                child: image==null?

                const Icon(Icons.camera_alt):Image.file(image!),
              ),
            ),
          ),
          const SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Name",
               // hintText: appProvider.getUserInformation.name,
              ),
            ),
          ),

          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: (){},
                child: const Text("Update")),
          )

        ],
      ),

    );
  }
}
