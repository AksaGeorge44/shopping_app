import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/constants/constants.dart';
import 'package:shopping_app1/models/productmodel/productmodel.dart';
import 'package:shopping_app1/provider/provider.dart';
import 'package:shopping_app1/screens/cartscreen/cartscreen.dart';

import '../../constants/routes.dart';
import '../checkout/checkout.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty=1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider =Provider.of<AppProvider>(context);


    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){Routes.instance.push(widget: CartScreen(),context:context);},
              icon: const Icon(Icons.shopping_cart))
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(widget.singleProduct.image,height: 250,width: 250,),
                  Padding(
                    padding: const EdgeInsets.only(left: 65,),
                    child: IconButton(onPressed: (){
                      setState(() {
                        widget.singleProduct.isFavourite=!widget.singleProduct.isFavourite;

                      }
                      );
                      if(widget.singleProduct.isFavourite){

                        appProvider.addFavouriteProduct(widget.singleProduct);

                      }
                      else{
                        appProvider.removeFavouriteProduct(widget.singleProduct);
                      }


                    },
                      icon: Icon(
                          appProvider.getFavouriteProductList.contains(widget.singleProduct) ?
                          Icons.favorite
                              :Icons.favorite_border),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.singleProduct.name,style: const TextStyle(
                        fontWeight: FontWeight.bold,),),

                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(widget.singleProduct.description),
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  CupertinoButton(
                    onPressed: (){
                      if(qty>=1){
                        setState(() {

                          qty--;
                        });
                      }

                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      child: Icon(Icons.remove),
                    ),
                  ),
                  const SizedBox(width: 12.0,),

                  Text(qty.toString(),

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  ),


                  const SizedBox(width: 12.0),
                  CupertinoButton(
                    onPressed: (){
                      setState(() {
                        qty++;
                      });

                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: (){
                       // AppProvider appProvider=Provider.of<AppProvider>(context,listen: false);
                     ProductModel productModel=   widget.singleProduct.copyWith(qty: qty);
                        appProvider.addCartProduct(productModel);
                        showMessage("Added to Cart");
                      },
                      child: const Text("ADD TO CART"),
                  ),
                  const SizedBox(width: 24,),
                  SizedBox(height: 38,width: 140,
                    child: ElevatedButton(onPressed: (){
                      ProductModel productModel=
                      widget.singleProduct.copyWith(qty: qty);

                      Routes.instance.push(widget:CheckOut(singleProduct: productModel),context:context);
                      },

                        child: const Text("BUY")),
                  ),
                  const SizedBox(height: 15,),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
