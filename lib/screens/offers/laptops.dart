import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/productmodel/productmodel.dart';
import '../product_details/productdetails.dart';

class LaptopPage extends StatefulWidget {
  const LaptopPage({super.key});

  @override
  State<LaptopPage> createState() => _LaptopPageState();
}

class _LaptopPageState extends State<LaptopPage> {
  List<ProductModel>productModelList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laptops"),
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
      name: "HP 14s Intel Core i3 11th Gen",
      description: "HP 14s Intel Core i3 11th Gen(8 GB/512 GB SSD/Windows 11 Home) 14s - dy2508TU Thin Light Laptop  (14 inch, Natural Silver, 1.41 kg, With MS Office).Enjoy the slick operations and powerful performance of this HP laptop, which is stuffed with innovative features. You can effortlessly operate at your optimum with the aid of a strong processor and graphics card. You can complete your tasks swiftly thanks to this laptop's integrated 4G LTE configuration and USB connectors. You can bring everything you need with you thanks to this laptop's fast booting technology.",
      image: "https://rukminim1.flixcart.com/image/312/312/xif0q/computer/f/g/c/-original-imagp7pfkztgtg93.jpeg?q=70",
      isFavourite: false,
      price:38499,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "2",
      name: "ASUS Vivobook 15 Core i3 11th Gen",
     description: "ASUS Vivobook 15 Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) X515EA-EJ322WS | X515EA-EJ328WS Thin and Light Laptop  (15.6 Inch, Transparent Silver, 1.80 kg, With MS Office).The outstanding Asus VivoBook 15 laptop, created to simplify your workday and improve performance, offers fantastic efficiency and stunning aesthetics. This laptop handles all of your multitasking requirements and gives you dynamic performance thanks to the Intel Core processor. Additionally, the dual-storage ASUS VivoBook 15 offers you the benefits of incredibly fast data speed and ample storage capacity. Moreover, its svelte and exquisite form makes you the centre of attention everywhere you go when donning it with you.",
      image: "https://rukminim1.flixcart.com/image/312/312/xif0q/computer/q/e/z/-original-imagpxgqesgrthks.jpeg?q=70",
      isFavourite: false,
      price:35000,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "3",
      name: "Acer Aspire Core i3 12th Gen",
      description: "Acer Aspire Core i3 12th Gen - (8 GB/512 GB SSD/Windows 11 Home) A315-59 Notebook  (15.6 inch, Pure Silver, 1.7 Kg, With MS Office).Fused with the latest 12th Gen Intel Core processor, you get to do all your work and play on this laptop efficiently. The performance and productivity is rapid, with smooth ease of use. Updated with Windows 11, you can work seamlessly all day. Experience a trouble-free network connection and enjoy ultimate web browsing satisfaction on this incredibly built Acer laptop.",
      image: "https://rukminim1.flixcart.com/image/312/312/xif0q/computer/g/v/h/-original-imagqbudxbf9djaz.jpeg?q=70",
      isFavourite: false,
// price: "24,000",
      price:35500,
      status: "pending", qty: null
  ),
  ProductModel(
    id: "4",
    name: "Acer Extensa Core i3 11th Gen",
description: "Acer Extensa Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) EX 215-54/ EX 215-54-356V Thin and Light Laptop  (15.6 Inch, Charcoal Black, 1.7 Kg).Witness stellar performance and smooth shuffling between multiple tasks with the Acer Extensa Core i3 11th Gen laptop. Harnessing the power of the 11th Gen Intel Core i3 processor and 8 GB of DDR4 system memory, this laptop lets you seamlessly complete all your multitasking and computing needs. Also, the laptop comes with a Full HD display and narrow border so that you can enjoy impeccable visual clarity along with a wide viewing space. Moreover, thanks to the internal memory capacity of 512 GB, you can get a fast data transfer and storage speed.",
    image: "https://rukminim1.flixcart.com/image/312/312/xif0q/computer/j/y/l/-original-imagnpcezv5dfdew.jpeg?q=70",
    isFavourite: false,
    status: "pending",
    price:34000,
  ),
  ProductModel(
      id: "5",
      name: "Lenovo IdeaPad Slim 3 Intel Core i3 11th Gen",
      description: "Lenovo IdeaPad Slim 3 Intel Core i3 11th Gen - (8 GB/256 GB SSD/Windows 11 Home) 15ITL05 Thin and Light Laptop  (15.6 Inch, Platinum Grey, 2.43 kg, With MS Office).You can work, study, and play games even on the go with the slim Lenovo IdeaPad 3 Laptop. Its lightweight build of up to 1.7 kg makes it easy for you to carry it along wherever you go. Additionally, this laptop features a stylish design courtesy of its thinness of just up to 19.9 mm. Moreover, this laptop's 11th Gen Intel Core i3 processor enables you to concentrate on your deadlines and stream your favourite shows without experiencing any noticeable lag.",
      image: "https://rukminim1.flixcart.com/image/416/416/xif0q/computer/6/t/7/15itl05-thin-and-light-laptop-lenovo-original-imagheh5nvy6gq9k.jpeg?q=70",
      isFavourite: false,
      price:39999,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "6",
      name: "Lenovo ThinkBook 15 Ryzen 3 HeXa Core 5300U",
      description: "Lenovo ThinkBook 15 Ryzen 3 Hexa Core 5300U - (8 GB/512 GB SSD/Windows 11 Home) TB15 G3 ACL Thin and Light Laptop  (15.6 Inch, Mineral Grey, 1.7 Kg).Stylish & Portable Thin and Light Laptop,15.6 Inch Full HD Anti-glare Display,Finger Print Sensor for Faster System Access,Light Laptop without Optical Disk Drive",
      image: "https://rukminim1.flixcart.com/image/312/312/xif0q/computer/f/8/q/-original-imagzfwfnze4gfxd.jpeg?q=70",
      isFavourite: false,
      price:32695,
      status: "pending", qty: null
  ),



];

