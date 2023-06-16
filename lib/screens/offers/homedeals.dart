import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/productmodel/productmodel.dart';
import '../product_details/productdetails.dart';

class HomeDealsPage extends StatefulWidget {
  const HomeDealsPage({super.key});

  @override
  State<HomeDealsPage> createState() => _HomeDealsPageState();
}

class _HomeDealsPageState extends State<HomeDealsPage> {
  List<ProductModel>productModelList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homedeals"),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(11),
        shrinkWrap: true,
        itemCount: bestdeals.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.4,
            crossAxisCount: 2),

        itemBuilder: (ctx,index){
          ProductModel singleProduct=bestdeals[index];
          return  Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Image.network(singleProduct.image,height: 120,width: 120,),
                const SizedBox(height: 25,),
                Text(
                  singleProduct.name,
                  style: const TextStyle(
                    fontSize: 11,fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25,),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 15,),
                    Text("M.R.P: \$${singleProduct.price}"),
                  ],
                ),
                const SizedBox(height: 30,),
                OutlinedButton(onPressed: (){
                  Routes.instance.push(
                      widget:ProductDetails(singleProduct: singleProduct),
                      context:context);
                },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,backgroundColor: Colors.redAccent,
                  ),
                  child: const Text("Buy",style: TextStyle(fontSize: 20,color: Colors.black),),),
              ],
            ),
          );
        },
      ),

    );
  }
}

List<ProductModel>bestdeals=[
  ProductModel(
      id: "1",
      name: "Gastoves",
      description: "Pigeon Popular 2 Burner Glass Cooktop Glass Manual Gas Stove  (2 Burners)",
      image: "https://rukminim1.flixcart.com/image/150/150/xif0q/gas-stove/1/n/l/-original-imaghugtnhhyzkxq.jpeg?q=70",
      isFavourite: false,
      price:1499,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "2",
      name: "IronBox",
     description: "Nova Plus Azure NI 70 1100 W Dry Iron  (Indigo)",
     image: "https://rukminim1.flixcart.com/image/416/416/xif0q/iron/4/n/s/-original-imaghu2uz3dunqjz.jpeg?q=70",
      isFavourite: false,
      price:499,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "3",
      name: "Pressure Cooker",
      description: "Leo Natura Eco Select 3 L Pressure Cooker  (Aluminium)#JustHere",
      image: "https://rukminim1.flixcart.com/image/612/612/xif0q/pressure-cooker/o/x/z/-original-imaghy7tmkaeqg3b.jpeg?q=70",
      isFavourite: false,
// price: "24,000",
      price:600,
      status: "pending", qty: null
  ),
  ProductModel(
    id: "4",
    name: "Casserole",
    description: "Classic Essentials Marvel Pack of 2 Cook and Serve Casserole Set  (1050 ml)",
    image: "https://rukminim1.flixcart.com/image/612/612/k7qinbk0/casserole/b/m/s/itm004179-classic-essentials-original-imafpwk6zsfgne6k.jpeg?q=70",
    isFavourite: false,
    status: "pending",
    price:400,
  ),


];

