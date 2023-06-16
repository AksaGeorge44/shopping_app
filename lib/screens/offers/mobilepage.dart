import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/productmodel/productmodel.dart';
import '../product_details/productdetails.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({super.key});

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  List<ProductModel>productModelList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Phones"),
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
                const SizedBox(height: 100,),
                Image.network(singleProduct.image,height: 120,width: 120,),
                const SizedBox(height: 25,),
                Text(
                  singleProduct.name,
                  style: const TextStyle(
                    fontSize: 13,fontWeight: FontWeight.bold,
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
      name: "realme GT 2 (Paper White, 128 GB)(8 GB RAM)",
      description: "The Realme GT2 smartphone is designed with utmost care to provide you with a phone that is user-friendly, as well as, feature-loaded. This smartphone is driven by a Snapdragon 888 5G processor that enhances your performance and offers an impressive user experience. "
          "Additionally, the Samsung E4 AMOLED Display incorporated in this phone offers an excellent visual treat and a touch sampling rate of up to 360 Hz helps in delivering smooth operation of this phone. "
          "Furthermore, the Sony IMX766 OIS 50 MP camera equipped with this phone enables you to capture the beauty in everything that you like",
      image: "https://rukminim1.flixcart.com/image/312/312/l3rmzrk0/mobile/m/o/3/-original-imagetmeb3y23xhb.jpeg?q=70",
      isFavourite: false,
      price:39999,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "2",
      name: "Samsung Galaxy S21 FE5G(128GB)(8GB RAM)",
      description: "With the Samsung Galaxy S21 FE, you can experience seamless gaming and mesmerising photography. This device is made to make you smile every time you unlock it. With only a little tap, you can capture amazing moments with this phone's professional-grade camera. Additionally, the 32 MP front camera on this device enables you to take amazing selfies with colourful images. Furthermore, you can make use of this phone's 16.28 cm (6.4) dynamic AMOLED 2X display to significantly improve your multimedia experience. In addition, this phone's 120 Hz Super Smooth Display helps you to play your favourite games smoothly without any stuttering",
      image: "https://rukminim1.flixcart.com/image/200/200/kzpw2vk0/mobile/u/o/q/galaxy-s21-fe-5g-lavender-8gb-128gb-storage-sm-g990elviinu-original-imagbnbdaj3tygup.jpeg?q=70",
      isFavourite: false,
      price:35000,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "3",
      name: "vivo T1 44W (Midnight Galaxy, 128 GB)(8 GB RAM)",
      description: "Enjoy gaming thrills and capture your memorable moments with the Vivo T1 smartphone. This mobile phone is driven by a Snapdragon 680 processor so that you can get speeded up performance on this phone. Also, it comes with a 50 MP high-definition camera so that you can click sharp details even in low light conditions. And, thanks to the Funtouch OS 12, you can enjoy a smooth user experience",
      image: "https://rukminim1.flixcart.com/image/200/200/l2p23rk0/mobile/s/4/3/-original-imagdznhcbdfwfud.jpeg?q=70",
      isFavourite: false,
// price: "24,000",
      price:17500,
      status: "pending", qty: null
  ),
  ProductModel(
    id: "4",
    name: "realme 10 Pro+ 5G (Nebula Blue, 128 GB)(6 GB RAM)",
    description: "Display your personality and make a fashion statement with the Realme 10 Pro+ 5G, which gives you a fantastic user experience. With its 17.01 cm (6.7) AMOLED curved display screen that has 2160 Hz PWM Dimming, TUV Rheinland Low Blue Light Certificate, 1260 Hz Turbocharged Touch Sampling, and X-touch Anti-mistouch Algorithm, this smartphone makes a great advancement",
    image: "https://rukminim1.flixcart.com/image/312/312/xif0q/mobile/y/z/r/-original-imagkp8yzvqffyhc.jpeg?q=70",
    isFavourite: false,
    status: "pending",
    price:30000,
  ),
  ProductModel(
      id: "5",
      name: "APPLE iPhone 12 (White, 64 GB)",
      description: "Dive into a world of crystal-clear visuals with this iPhone’s Super Retina XDR Display. This beast of a smartphone packs the A14 Bionic chip to make for blazing-fast performance speeds. On top of that, its Dual-camera System, along with Night Mode, helps you click amazing pictures and selfies even when the lighting isn’t as good as you’d want it to be.",
      image: "https://rukminim1.flixcart.com/image/312/312/kg8avm80/mobile/j/f/9/apple-iphone-12-dummyapplefsn-original-imafwg8dkyh2zgrh.jpeg?q=70",
      isFavourite: false,
      price:53999,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "6",
      name: "OnePlus Nord CE 2 Lite 5G (Blue Tide, 128 GB)(6 GB RAM)",
      description: "6 GB RAM | 128 GB ROM,16.74 cm (6.59 inch) Display,64MP Rear Camera,5000 mAh Battery",
      image: "https://rukminim1.flixcart.com/image/312/312/xif0q/mobile/k/w/k/-original-imagg2abzhxjckxu.jpeg?q=70",
      isFavourite: false,
      price:18695,
      status: "pending", qty: null
  ),



];

