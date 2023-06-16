import 'package:flutter/material.dart';

import '../../models/productmodel/productmodel.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  List<ProductModel>productModelList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offers"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(13),
        child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 11),
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
                  const SizedBox(height: 40,),
                  Image.network(singleProduct.image,height: 140,width: 140,),
                  const SizedBox(height: 25,),
                  Text(
                    singleProduct.name,
                    style: const TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 50,),
                  OutlinedButton(onPressed: (){

                  },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,backgroundColor: Colors.blue,
                    ),
                    child: const Text("Buy",style: TextStyle(fontSize: 20,color: Colors.black),),),
                ],
              ),
            );
          },
        ),
      ),

    );
  }
}

List<ProductModel>bestdeals=[
  ProductModel(
      id: "1",
      name: "Laptops",
      description: "Intel Core i5-1155G7 (up to 4.5 GHz with Intel Turbo Boost Technology(2g),"
          " 8 MB L3 cache, 4 cores, 8 threads)|""\n"
          "Memory: 8 GB DDR4-3200 MHz RAM (1 x 8 GB)"
          " Upto 16 GB DDR4-3200 MHz RAM (2 x 8 GB)|""\n"
          "Storage: 512 GB PCIe NVMe M.2 SSD",
      image: "https://m.media-amazon.com/images/I/41vP421pVNL._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price:20000,
      status: "pending", qty: null
  ),
ProductModel(
id: "2",
name: "Mobile Phones",
description: "HP 15s, 11th Gen Intel Core i3 8GB RAM/1TB HDD+256 GB SSD 15.6-inches/39.6 cm FHD Laptop/Windows 11/Intel UHD Graphics/Dual Speakers/Alexa/MSO/Fast Charge/1.75 Kg, 15s-du3614TU",
image: "https://m.media-amazon.com/images/I/413+4T+ISML._AC_SF160,160_QL100_.jpg",
isFavourite: false,
// price: "10745",
price:10000,
status: "pending", qty: null
),
ProductModel(
id: "3",
name: "Tabs",
description: "Redmi A2 (Classic Black, 4GB RAM, 64GB Storage) | Powerful Octa Core G36 Processor | Upto 7GB RAM | Large 16.5 cm HD+ Display with Massive 5000mAh Battery | 2 Years Warranty",
image: "https://m.media-amazon.com/images/I/318+gJAl1AL._AC_SF160,160_QL100_.jpg",
isFavourite: false,
// price: "24,000",
price:20000,
status: "pending", qty: null
),
ProductModel(
id: "4",
name: "Mobiles",
description: "description",
image: "https://m.media-amazon.com/images/I/41OTV3--tOL._AC_SF160,160_QL100_.jpg",
isFavourite: false,

status: "pending",
price:15000,
// price: ' 20%Off', qty: null
),
ProductModel(
id: "5",
name: "Cameras",
description: "description",
image: "https://m.media-amazon.com/images/I/41rsT6YSLTL._AC_SF160,160_QL100_.jpg",
isFavourite: false,
price:10000,
//price: " 25%Off",
status: "pending", qty: null
),
ProductModel(
id: "6",
name: "TV",
description: "description",
image: "https://m.media-amazon.com/images/I/41WE9ZGEC4L._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
// price: "10%Off",
price:20000,
status: "pending", qty: null
),

ProductModel(
id: "7",
name: "Musical Instruments",
description: "description",
image: "https://m.media-amazon.com/images/I/51M9T0C4ssL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price:10000,
//price: "10%Off",
status: "pending", qty: null
),
ProductModel(
id: "8",
name: "Furniture Deals",
description: "description",
image: "https://m.media-amazon.com/images/I/51SwORixAyL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
// price: "15%Off",
price:20000,
status: "pending", qty: null
),
ProductModel(
id: "9",
name: "Storage Devices",
description: "description",
image: "https://m.media-amazon.com/images/I/21qvad6Z1oL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
//price: "15%Off",
price:20000,
status: "pending", qty: null
),
ProductModel(
id: "10",
name: "Shoes",
description: "description",
image: "https://m.media-amazon.com/images/I/91OOpHXtdvL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
//price: "30%Off",
price:20000,
status: "pending", qty: null
),
ProductModel(
id: "11",
name: "Cleaning Supplies",
description: "Ant Esports H530 Multi-Platform Pro RGB Gaming Headsetfor PC / PS4 / PS5 / Xbox One / Switch1 with mic, Black Red",
image: "https://m.media-amazon.com/images/I/41zt8dUR1fL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
//price: "20%Off",
price:20000,
status: "pending", qty: null
),

ProductModel(
id: "12",
name: "Summer Care Products",
description: "description",
image: "https://m.media-amazon.com/images/I/41sQEQUSg6L._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
//price: "30%Off",
price:20000,
status: "pending", qty: null
),
ProductModel(
id: "13",
name: "Health Care Products",
description: "description",
image: "https://m.media-amazon.com/images/I/41+A74tyqRL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 2000,
status: "pending", qty: null
),
ProductModel(
id: "14",
name: "Kidswear",
description: "Dell Vostro 3420 Laptop, Intel Core i3-1115G4, 8GB DDR4 & 256GB SSD, Win 11 + MSO'21, 14.0""\n""35.56Cms FHD WVA AG 250 nits, 15 Month McAfee, Carbon Black, 1.48Kgs",
image: "https://m.media-amazon.com/images/I/51co4+m532L._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 1000,
status: "pending", qty: null
),
ProductModel(
id: "15",
name: "Watches",
description: "Samsung 183 L 4 Star Digital Inverter Direct Cool Single Door Refrigerator (RR20C1824CR/HL, Camellia Purple, Base Stand with Drawer 2023 Model)",
image: "https://m.media-amazon.com/images/I/41vPfBeVjxL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 12000,
status: "pending", qty: null
),
ProductModel(
id: "16",
name: "Air Fryers",
description: "Vega Crux ISI Certified Flip-Up Helmet for Men and Women with Clear Visor(Black, Size:L)""\n"
"High Impact ABS Material Shell with texture finish.",
image: "https://m.media-amazon.com/images/I/313WfOy8VSL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 1590,
status: "pending", qty: null
),

ProductModel(
id: "17",
name: "Top sellers in kitchen",
description: "",
image: "https://m.media-amazon.com/images/I/51GtDrgENNL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 1000,
status: "pending", qty: null
),

ProductModel(
id: "18",
name: "Best selling books",
description: "",
image: "https://m.media-amazon.com/images/I/51UtH2UMb+S._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 1000,
status: "pending", qty: null

),
ProductModel(
id: "19",
name: "Backpacks",
description: "",
image: "https://m.media-amazon.com/images/I/41zXlQ10r1L._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 1590,
status: "pending", qty: null
),

ProductModel(
id: "20",
name: "Jewellery",
description: "",
image: "https://m.media-amazon.com/images/I/41iUqcYQvZL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 1450,
status: "pending", qty: null
),

ProductModel(
id: "21",
name: "Kurtas,sarees and more",
description: "",
image: "https://m.media-amazon.com/images/I/51vs7jysxUL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 200,
status: "pending", qty: null
),
ProductModel(
id: "22",
name: "Backpacks",
description: "",
image: "https://m.media-amazon.com/images/I/41zXlQ10r1L._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 1590,
status: "pending", qty: null
),
ProductModel(
id: "23",
name: "Footwears",
description: "",
image: "https://m.media-amazon.com/images/I/91lPhDi9-OL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 150,
status: "pending", qty: null
),
ProductModel(
id: "24",
name: "Chocalates",
description: "",
image: "https://m.media-amazon.com/images/I/516ZZP8kyOL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 1590,
status: "pending", qty: null
),
ProductModel(
id: "25",
name: "Protein Supplements",
description: "",
image: "https://m.media-amazon.com/images/I/41jQg7jeHtL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 1590,
status: "pending", qty: null
),

ProductModel(
id: "26",
name: "Beauty Products",
description: "",
image: "https://m.media-amazon.com/images/I/41+7DFZuWgL._AC_UF226,226_FMjpg_.jpg",
isFavourite: false,
price: 1590,
status: "pending", qty: null
),






];

