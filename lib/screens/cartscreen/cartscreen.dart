import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/provider/provider.dart';
import 'package:shopping_app1/screens/cartscreen/widgets/singlecartitem.dart';

import '../../constants/constants.dart';
import '../../constants/routes.dart';
import '../../widgets/primary_button/primary_button.dart';
import '../cartitemchekout/cartitemchekout.dart';

class CartScreen extends StatefulWidget {

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("TotalPrice",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text(
                    "\$${appProvider.totalPrice().toString()}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              PrimaryButton(title: "Checkout",onPressed: (){
    appProvider.clearBuyProduct();
    appProvider.addBuyProductCartList();
    appProvider.clearCart();
    if (appProvider.getBuyProductList.isEmpty) {
    showMessage("Cart is empty");
    } else {
    Routes.instance.push(
    widget: const CartItemCheckout(), context: context);
    }
    },
              )
            ],
          ),
        ),
      ),

      appBar: AppBar(
      title: const Text("CartScreen"),
      ),

      body: appProvider.getCartProductList.isEmpty?
          const Center(
            child: Text("Empty"),
          ):

      Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: appProvider.getCartProductList.length,
            itemBuilder: (ctx,index){
              return SingleCartItem(singleProduct: appProvider.getCartProductList[index],);

            }

        ),
      ),
    );
  }
}
