import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/productmodel/productmodel.dart';
import '../product_details/productdetails.dart';

class FashionsPage extends StatefulWidget {
  const FashionsPage({super.key});

  @override
  State<FashionsPage> createState() => _FashionsPageState();
}

class _FashionsPageState extends State<FashionsPage> {
  List<ProductModel>productModelList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fashion"),
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
      name: "Sneakers",
      description: "Top Quality shoes",
      image: "https://rukminim1.flixcart.com/image/150/150/l407mvk0/shoe/0/y/g/-original-imagfyy2txp7myhw.jpeg?q=70",
      isFavourite: false,
      price:3499,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "2",
      name: "Women Tops",
      description: "",
      image: "https://rukminim1.flixcart.com/image/150/150/xif0q/top/w/r/p/m-19570156-mast-harbour-original-imagm5tazhkvzmfz.jpeg?q=70",
      isFavourite: false,
      price:599,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "3",
      name: "Sunglasses",
      description: "",
      image: "https://rukminim1.flixcart.com/image/150/150/ktuewsw0/sunglass/f/q/n/daimond-cut-medium-singco-india-original-imag73fzzknhtnkq.jpeg?q=70",
      isFavourite: false,
// price: "24,000",
      price:600,
      status: "pending", qty: null
  ),
  ProductModel(
    id: "4",
    name: "Shoes",
    description: "Shoes For Men  (Black, White)",
    image: "https://rukminim1.flixcart.com/image/150/150/xif0q/shoe/r/z/f/-original-imaggp38p6qzr5g7.jpeg?q=70",
    isFavourite: false,
    status: "pending",
    price:1500.00,
  ),


];

