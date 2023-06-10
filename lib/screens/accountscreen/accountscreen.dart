import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/screens/editprofile/editprofile.dart';
import 'package:shopping_app1/widgets/primary_button/primary_button.dart';

import '../../constants/routes.dart';
import '../../provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("AccountScreen",style: TextStyle(
          color: Colors.black,

        ),),
      ),

      body: Column(
        children: [
          Expanded(child: Column(
            children: [
          //    appProvider.getUserInformation.image==null?
              const Icon(Icons.person_outlined,size: 100,),
          //    : Image.network(appProvider.getUserInformation.image!),

              const Text("Aksa George",

                style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
              const Text("aksa@gmail.com"),
              const SizedBox(height: 20,),
              SizedBox(
                  width: 130,height: 30,
                  child: PrimaryButton(title: "Edit Profile",onPressed: (){
                    Routes.instance.push(widget:const EditProfile(),context:context);

                  },))

            ],
          )
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                    onTap: (){},
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: const Text("Your Orders"),
                  ),
                  ListTile(
                    onTap: (){},

                    leading: const Icon(Icons.favorite),
                    title: const Text("Favourite"),
                  ),
                  ListTile(
                    onTap: (){},

                    leading: const Icon(Icons.info_outline),
                    title: const Text("About Us"),
                  ),
                  ListTile(
                    onTap: (){},

                    leading: const Icon(Icons.support),
                    title: const Text("Support"),
                  ),
                  ListTile(
                    onTap: (){},

                    leading: const Icon(Icons.exit_to_app),
                    title: const Text("Log Out"),
                  ),

                  const Text("Version:1.1.0"),





                ],
              ))

        ],
      ),

    );
  }
}
