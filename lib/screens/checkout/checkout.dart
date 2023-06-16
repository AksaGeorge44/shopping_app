import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/models/productmodel/productmodel.dart';
import 'package:shopping_app1/screens/custombtmbar/custombtmbar.dart';
import 'package:shopping_app1/widgets/primary_button/primary_button.dart';

import '../../constants/routes.dart';
import '../../firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import '../../provider/provider.dart';
import '../../stripehelper/stripehelper.dart';

class CheckOut extends StatefulWidget {
final ProductModel singleProduct;
   const CheckOut({super.key, required this.singleProduct, });

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int groupValue=1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider =Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
          body: Padding(
          padding: const EdgeInsets.all(12.0),
          child:   Column(
          children: [
           const SizedBox(height: 10),
            Container(
            height: 40,width: double.infinity,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
             border: Border.all(color: Theme.of(context).primaryColor,width: 2.0),

              ),
              child: Row(children: [
              Radio(value: 1, groupValue: groupValue, onChanged: (value){
            setState(() {
              groupValue=value!;
            });
          },
          ),

          //Icon(Icons.money),
          const SizedBox(height: 10),
          const Text("Cash on Delivery",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

          //Text("Pay Online"),
        ],),
      ),
      const SizedBox(height: 50,),
            Container(
        height: 40,width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor,width: 2.0),
            ),
           child: Row(children: [
             Radio(value: 2, groupValue: groupValue, onChanged: (value){
            setState(() {
              groupValue=value!;
            });

          },
          ),

          const SizedBox(height: 5,),
          const Text("Pay Online",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

          //Text("Pay Online"),

            ],),


          ),
            const SizedBox(height: 24,),
            PrimaryButton(title: "Continues",onPressed: ()async{
    appProvider.clearBuyProduct();
    appProvider.addBuyProduct(widget.singleProduct);

    if (groupValue == 1) {
    bool value = await FirebaseFirestoreHelper.instance
        .uploadOrderedProductFirebase(
    appProvider.getBuyProductList,
    context,
    "Cash on delivery");

    appProvider.clearBuyProduct();
    if (value) {
    Future.delayed(const Duration(seconds: 2), () {
    Routes.instance.push(
    widget: const CustomBottomBar(), context: context);
    });
    }
    } else {

    int value = double.parse(
    appProvider.totalPriceBuyProductList().toString())
        .round()
        .toInt();
    double totalPrice = (value * 100);
    await StripeHelper.instance
        .makePayment(totalPrice.toString(), context);
    }
    },
    ),



            ],
            ),
            ),
              );
               }
              }

