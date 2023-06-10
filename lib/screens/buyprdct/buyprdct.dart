import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/models/productmodel/productmodel.dart';
import 'package:shopping_app1/screens/custombtmbar/custombtmbar.dart';
import 'package:shopping_app1/widgets/primary_button/primary_button.dart';

import '../../constants/routes.dart';
import '../../provider/provider.dart';

class CheckOut extends StatefulWidget {
 final ProductModel singleProduct;
   const CheckOut({super.key, required this.singleProduct});

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
      const SizedBox(),
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

      const SizedBox(height: 25,),
      PrimaryButton(title: "Continue",onPressed:  () async{


      },)



    ],
  ),
),
    );
  }
}
class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  const CustomRadio({Key? key, required this.value, required this.groupValue, required this.onChanged})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(shape: BoxShape.circle, color: selected ? Colors.white : Colors.grey[200]),
        child: Icon(
          Icons.circle,
          size: 30,
          color: selected ? Colors.deepPurple : Colors.grey[200],
        ),
      ),
    );
  }
}
