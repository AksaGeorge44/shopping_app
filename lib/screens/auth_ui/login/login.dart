
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app1/constants/constants.dart';
import 'package:shopping_app1/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:shopping_app1/screens/auth_ui/sign_up/signup.dart';
import 'package:shopping_app1/screens/home/home.dart';
import 'package:shopping_app1/widgets/primary_button/primary_button.dart';
import '../../../constants/routes.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();
//TextEditingController name=TextEditingController();
//TextEditingController phoneno=TextEditingController();
  bool isShowPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 35,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                hintText: "E-mail",
                prefixIcon: Icon(Icons.email,color: Colors.grey,)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
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
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: PrimaryButton(title: "Login",onPressed: () async {

              var getemail=email.text;
              var getpassword=password.text;
              print(getemail);
              print(getpassword);

          // bool isValidated = loginVaildation(email.text, password.text);
           //if(isValidated){
          //bool isLoginied = await  FirebaseAuthHelper.instance.login(email.text, password.text, context);
          //if(isLoginied){Routes.instance.pushAndRemoveUntil(widget: const Home(), context: context);}}

            },),
          ),
          const SizedBox(height: 15,),
          const Center(child: Text("Don't have an account?")),
          const SizedBox(height: 15,),
          Center(child: CupertinoButton(
              onPressed: (){
                Routes.instance.push(widget:const SignUp(),context:context);

              }, child: const Text("Create an account",))),


      ],
      ),
    );
  }
}
