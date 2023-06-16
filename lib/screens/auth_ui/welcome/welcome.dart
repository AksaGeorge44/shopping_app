import 'package:flutter/material.dart';
import 'package:shopping_app1/screens/auth_ui/login/login.dart';
import 'package:shopping_app1/screens/auth_ui/sign_up/signup.dart';
import 'package:shopping_app1/widgets/primary_button/primary_button.dart';
import 'package:shopping_app1/widgets/top_titles/top_titles.dart';

import '../../../constants/routes.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const TopTitles(title: "", subtitle:"Buy Products"),
              const Center(child: Padding(
                padding: EdgeInsets.all(8.0),

                child: Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

              ),

              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,width: double.infinity,
                child: ElevatedButton(onPressed: (

                    ){
                  Routes.instance.push(widget:const Login(),context:context );

                }, child: const Text("Login",style: TextStyle(color: Colors.black),),),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(title: "SignUp",
                  onPressed: (){
                    Routes.instance.push(widget:const SignUp(),context:context );

                  },),
              )


            ],
          ),
        ),
      ),
    );
  }
}
