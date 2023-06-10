import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/provider/provider.dart';
import 'package:shopping_app1/screens/cartscreen/widgets/singlecartitem.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qty=0;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
      title: Text("CartScreen"),
      ),
      body: appProvider.getCartProductList.isEmpty?
          const Center(
            child: Text("Empty"),
          ):

      ListView.builder(
          itemCount: appProvider.getCartProductList.length,
          itemBuilder: (ctx,index){
            return SingleCartItem(singleProduct: appProvider.getCartProductList[index],);

          }

      ),
    );
  }
}
