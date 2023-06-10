import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/models/productmodel/productmodel.dart';

import '../../../provider/provider.dart';

class SingleFavouriteItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavouriteItem({super.key,required this.singleProduct});

  @override
  State<SingleFavouriteItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(bottom: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,width: 2.5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 230,
                color: Colors.black.withOpacity(0.2),
                child: Image.network(widget.singleProduct.image),
              ),
            ),
            const SizedBox(width: 50,),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.singleProduct.name,
                                style: const TextStyle(
                                  fontSize: 18,fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),




                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){

                              AppProvider appProvider =Provider.of<AppProvider>(context,listen: false);
                              appProvider.removeFavouriteProduct(widget.singleProduct);
                              const AlertDialog(semanticLabel: "Removed to Wishlist");
                            },
                            child: const Text("Removed to Wishlist",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,fontWeight: FontWeight.bold,
                              ),),
                          ),
                          const SizedBox(height: 25,),
                           Row(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 15,),

                              Text("\$${widget.singleProduct.price.toString()}",
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                            ],
                          ),
                          // color: Colors.red.withOpacity(0.5),
                        ],
                      ),
                    ],
                  ),

                ),
              ),

            ),
          ],
        ),

      ),
    );
  }
}
