//import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/models/usermodel/usermodel.dart';
import 'package:shopping_app1/provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File?image;

  void takePicture()async{
 XFile?value= await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 40);

 if(value!=null){
   setState(() {
     image= File(value.path);
   });

 }

  }
  TextEditingController name=TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),

    children: [
          image==null?
    CupertinoButton(
              onPressed: (){
                takePicture();

              },
              child:const CircleAvatar(
                radius: 70,
                child:
                 Icon(Icons.camera_alt)),)
                : CupertinoButton(
        onPressed: (){
      takePicture();

    },
    child: CircleAvatar(
    backgroundImage:FileImage(image!),
    radius: 70,
   ),
    ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                hintText: appProvider.getUserInformation.name,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
               // hintText: appProvider.getUserInformation.name,
              ),
            ),
          ),

          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(onPressed: ()async{
             UserModel userModel=appProvider.getUserInformation.copyWith(name: name.text);
             appProvider.updateUserInfoFirebase(context, userModel, image);
            },
                child: const Text("Update",style: TextStyle(fontSize: 25),)),
          )

        ],
      ),

    );
  }
}
