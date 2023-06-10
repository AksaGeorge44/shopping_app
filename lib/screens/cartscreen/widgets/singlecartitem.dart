import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/models/productmodel/productmodel.dart';

import '../../../constants/constants.dart';
import '../../../provider/provider.dart';

class SingleCartItem extends StatefulWidget {
  ProductModel singleProduct;
  SingleCartItem({super.key,required this.singleProduct});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty=1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(height: 250,
       margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.redAccent,width: 3),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 200,width: 100,
                child: Image.network(widget.singleProduct.image),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Stack(
                  alignment: Alignment.bottomRight,

                    children: [
                      Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.singleProduct.name,
                              style: const TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold,
                              ),
                            ),
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
                                    maxRadius: 13,
                                    child: Icon(Icons.remove),
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

                                  },
                                  child: const CircleAvatar(
                                    maxRadius: 13,
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),

                                  Row(
                                    children: [
                                      CupertinoButton(
                                          onPressed: (){

                                          },
                                          child:
                                          Text("Add to Wishlist",
                                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                      ),
                                    ],
                                  ),
                            ],
                              ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("\$${widget.singleProduct.price.toString()}",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        CupertinoButton(
                          onPressed: (){
                            AppProvider appProvider=Provider.of<AppProvider>(context,listen: false);
                            appProvider.removeCartProduct(widget.singleProduct);
                            showMessage("Removed from Cart");

                          },
                          child: CircleAvatar(
                            //maxRadius: 12,
                            child: Icon(Icons.delete),
                          ),

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
