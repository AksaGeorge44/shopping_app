import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app1/screens/custombtmbar/custombtmbar.dart';
import 'package:shopping_app1/widgets/primary_button/primary_button.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isShowPassword=true;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 45,),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(Icons.person,color: Colors.grey,)
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "E-mail",
                    prefixIcon: Icon(Icons.email,color: Colors.grey,)
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Phone",
                    prefixIcon: Icon(Icons.phone,color: Colors.grey,)
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              
              TextFormField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.password,color: Colors.grey,),
                  suffixIcon: CupertinoButton(
                      onPressed: (){
                        setState(() {
                          isShowPassword=!isShowPassword;
                        });
                      },
                      child: const Icon(Icons.visibility_sharp,color: Colors.grey,)),
                ),
              ),
              const SizedBox(height: 15,),
              PrimaryButton(title: "Create an account",onPressed: () async {
    bool isVaildated = signUpValidation(
    email.text, password.text, name.text, phone.text);
    if (isVaildated) {
    bool isLogined = await FirebaseAuthHelper.instance
        .signUp(name.text, email.text, password.text, context);
    if (isLogined) {
    Routes.instance.pushAndRemoveUntil(
    widget: const CustomBottomBar(), context: context);
    }
    }
    },

              ),

              const SizedBox(height: 15,),
              const Center(child: Text("Already have an account")),
              const SizedBox(height: 15,),
              Center(child: CupertinoButton(onPressed: (){
                Navigator.of(context).pop();

              }, child: const Text("Login",))),


            ],
          ),
        ),
      ),
    );
  }
}
