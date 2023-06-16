import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/models/productmodel/productmodel.dart';

import '../../../constants/constants.dart';
import '../../../provider/provider.dart';

class SingleCartItem extends StatefulWidget {
  final ProductModel singleProduct;

  const SingleCartItem({super.key, required this.singleProduct});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty=1;
  @override
  void initState(){
    qty=widget.singleProduct.qty??1;
    setState(() {
      super.initState();
    });
  }
@override

  Widget build(BuildContext context) {
  AppProvider appProvider =Provider.of<AppProvider>(context);

  return Container(
   margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.redAccent,width: 1),
    ),
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            child: Image.network(widget.singleProduct.image,),

          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
              alignment: Alignment.bottomRight,
                children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.singleProduct.name),





                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: CupertinoButton(
                                onPressed: (){
                                  if(qty>1){
                                    setState(() {

                                      qty--;
                                    });
                                    appProvider.updateQty(widget.singleProduct, qty);

                                  }

                                },
                                padding: EdgeInsets.zero,
                                child: const CircleAvatar(
                                  maxRadius: 13,
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ),
                            Text(qty.toString(),

                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            CupertinoButton(
                              onPressed: (){
                                setState(() {
                                  qty++;
                                });
                                appProvider.updateQty(widget.singleProduct, qty);

                              },
                              child: const CircleAvatar(
                                maxRadius: 13,
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),

                        CupertinoButton(padding: EdgeInsets.zero,
                                  onPressed: (){
                                    if(!appProvider.getFavouriteProductList.contains(widget.singleProduct)){

                                      appProvider.addFavouriteProduct(widget.singleProduct);
                                      showMessage("Added to wishlist");

                                    }
                                    else{
                                      appProvider.removeFavouriteProduct(widget.singleProduct);
                                      showMessage("Removed to wishlist");

                                    }

                                  },
                                  child:
                                  Text(appProvider.getFavouriteProductList.contains(widget.singleProduct)?
                                  "Remove to Wishlist":
                                    "Add to Wishlist",
                                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                              ),
                        ],
                          ),


                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: Text("\$${widget.singleProduct.price.toString()}",
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                          ),
                        ),
                      ],
                    ),


                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CupertinoButton(
                        onPressed: (){
                          appProvider.removeCartProduct(widget.singleProduct);
                          showMessage("Removed from Cart");

                        },
                        child: const CircleAvatar(
                          //maxRadius: 12,
                          child: Icon(Icons.delete),
                        ),

                      ),
                  ),

                  ],
                ),
              ),
          ),
        ),
      ],
    ),

  );
  }
}



