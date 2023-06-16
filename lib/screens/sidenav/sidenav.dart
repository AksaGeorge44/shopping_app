import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/screens/accountscreen/accountscreen.dart';
import 'package:shopping_app1/screens/cartscreen/cartscreen.dart';
import 'package:shopping_app1/screens/custombtmbar/custombtmbar.dart';
import 'package:shopping_app1/screens/offers/fashions.dart';
import 'package:shopping_app1/screens/offers/homedeals.dart';
import 'package:shopping_app1/screens/offers/laptops.dart';
import 'package:shopping_app1/screens/offers/mobilepage.dart';
import 'package:shopping_app1/screens/offers/offers.dart';
import 'package:shopping_app1/screens/orderscreen/orderscreen.dart';

import '../../constants/routes.dart';
import '../../provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(
      context,
    );
    return Drawer(
      child: ListView(
        children: [
IconButton(onPressed: (){
  Routes.instance.push(widget: const CustomBottomBar(), context: context);
}, icon: const Padding(
  padding: EdgeInsets.only(right: 600),
  child:   Icon(Icons.arrow_back,color: Colors.black,),
),),
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Text(appProvider.getUserInformation.name),
            ),
              decoration: const BoxDecoration(
                color: Colors.blue
              ),
              accountName: Text(appProvider.getUserInformation.name),
              accountEmail: Text(appProvider.getUserInformation.email)),

           ListTile(
            onTap: (){
              Routes.instance.push(widget: const OfferScreen(), context: context);

            },
            title: const Text("Offer Zone"),
          ),

          ListTile(
            onTap: (){
              Routes.instance.push(widget: const MobilePage(), context: context);

            },
            title: const Text("Mobiles"),
          ),

          ListTile(
            onTap: (){
              Routes.instance.push(widget: const LaptopPage(), context: context);

            },
            title: const Text("Laptops"),
          ),
          ListTile(
            onTap: (){
              Routes.instance.push(widget: const HomeDealsPage(), context: context);

            },


            title: const Text("Home Deals"),
          ),



          ListTile(
            onTap: (){
              Routes.instance.push(widget: const FashionsPage(), context: context);

            },
            title: const Text("Fashion"),
          ),
          const ListTile(
            title: Text("Food"),
          ),
          const ListTile(
            title: Text("Bags"),
          ),
          const ListTile(
            title: Text("Headphones"),
          ),
          const ListTile(
            title: Text("Books"),
          ),
          const ListTile(
            title: Text("Watches"),
          ),
          ListTile(
            onTap: (){
              Routes.instance.push(widget: const CartScreen(), context: context);

            },
            title: const Text("My Cart"),
          ),
          ListTile(
            onTap: (){
              Routes.instance.push(widget: const OrderScreen(), context: context);

            },
            title: const Text("My Orders"),
          ),
          ListTile(
            onTap: (){
              Routes.instance.push(widget: const AccountScreen(), context: context);

            },
            title: const Text("My Account"),
          ),
          const ListTile(
            title: Text("Help Centre"),
          ),

        ],
      ),
    );
  }
}
