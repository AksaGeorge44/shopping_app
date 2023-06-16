import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/provider/provider.dart';
import 'package:shopping_app1/screens/auth_ui/login/login.dart';
import 'package:shopping_app1/screens/cartscreen/cartscreen.dart';
import 'package:shopping_app1/screens/offers/offers.dart';
import 'package:shopping_app1/screens/product_details/productdetails.dart';
import 'package:shopping_app1/screens/sidenav/sidenav.dart';

import '../../constants/routes.dart';
import '../../models/categorymodel/categorymodel.dart';
import '../../models/productmodel/productmodel.dart';


class Home extends StatefulWidget {
   const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel>categoryList=[];
  List<ProductModel>productModelList=[];

  bool isLoading=false;
  @override
  void initState(){
    AppProvider appProvider=Provider.of<AppProvider>(context,listen:false);
     appProvider.getUserInfoFirebase();
    getCategoryList();
    super.initState();

  }
  void getCategoryList()async{
    setState(() {

      isLoading=true;

    });

    //FirebaseFirestoreHelper.instance.updateTokenFromFirebase();
    //categoriesList=await FirebaseFirestoreHelper.instance.getCategories();
    //productModelList=await FirebaseFirestoreHelper.instance.getBestProducts();

    productModelList.shuffle();

    setState(() {
      isLoading=false;
    });

  }
TextEditingController search=TextEditingController();
var size,height,width;

  List<ProductModel> searchList = [];
  void searchProducts(String value) {
    searchList = productModelList
        .where((element) =>
        element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("EcommerceApp"),
          leading: TextButton(onPressed: (){
            Routes.instance.push(widget: MyDrawer(), context: context);
          }, child: Icon(Icons.menu,color: Colors.black,)),
          actions: [
            const SizedBox(width: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style:  ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent.withOpacity(1.0))),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));

                },
                child: const Text("Login"),),
            ),
            const SizedBox(width: 50,),
            const Icon(Icons.notifications),
            const SizedBox(width:30),

            CupertinoButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
            },
                child: const Icon(Icons.shopping_cart,color: Colors.white,)),

          ],
        ),

        
        
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    SizedBox(height: 50,width: 800,
                      child: TextFormField(
                        controller: search,
                        onChanged: (String value){
                          searchProducts(value);
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search for Products,Items and more...."
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Categories",style: TextStyle(
                  fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple
                ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal
                ,
                child: Row(
                  children:
                  categoriesList.map(
                        (e) => Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          Routes.instance.push( context: context, widget:  OfferScreen());
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(e),
                          ),

                        ),
                      ),
                    ),)
                      .toList(),
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(height: 350,
                  child:Card(
                    color: Colors.white,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child:
                    SingleChildScrollView(scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Image.asset("assets/images/img.png",height:300,width:300,fit: BoxFit.cover,),
                            const SizedBox(width: 20,),
                            Image.asset("assets/images/appliances.png",height:300,width:300,fit: BoxFit.cover,),
                            const SizedBox(width: 20,),
                            Image.asset("assets/images/vector1.png",height:300,width:300,fit: BoxFit.cover,),

                            const SizedBox(width: 20,),
                            Image.asset("assets/images/appliances1.png",height:300,width:280,fit: BoxFit.cover,),

                          ],
                        ),
                      ),
                    ),

                  ) ,
                ),
              ),

              Padding(padding: EdgeInsets.all(15),
                child: Text(
                  "Best Deals",style: TextStyle(
                  fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple
                ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(25),
                child: GridView.builder(
                  padding: const EdgeInsets.all(11),
                  shrinkWrap: true,
                  itemCount: bestProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                       childAspectRatio: 0.5,
                      crossAxisCount: 2),

                  itemBuilder: (ctx,index){
                    ProductModel singleProduct=bestProducts[index];
                    return  Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.blue),
                      ),
                      child: Column(
                        children: [
                          Image.network(singleProduct.image,height: 100,width: 100,),
                         // const SizedBox(height: 25,),
                          Text(
                            singleProduct.name,
                            style: const TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,
                            ),
                          ),
                         const SizedBox(height: 20,),
                           Row(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             SizedBox(width: 15,),
                              Text("M.R.P: \$${singleProduct.price}"),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          OutlinedButton(onPressed: (){
                            Routes.instance.push(
                                widget:ProductDetails(singleProduct: singleProduct),
                                context:context);
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

            ],
          ),
        )
    );
  }
}
List<String> categoriesList=[
  "https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100",
  "https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100",
  "https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100",
  "https://rukminim1.flixcart.com/flap/128/128/image/ab7e2b022a4587dd.jpg?q=100",
  "https://rukminim1.flixcart.com/fk-p-flap/128/128/image/0d75b34f7d8fbcb3.png?q=100",
  "https://rukminim1.flixcart.com/flap/128/128/image/29327f40e9c4d26b.png?q=100",
  "https://rukminim1.flixcart.com/flap/200/200/image/f1ffa6330a602013.jpeg?q=70",
  "https://m.media-amazon.com/images/G/31/img20/Events/Jup21dealsgrid/computer_accessories.jpg",
  "https://m.media-amazon.com/images/G/31/img20/Events/Jup21dealsgrid/All_ASIN-Icons_150x150_Books.jpg",
  "https://m.media-amazon.com/images/G/31/img20/Events/Jup21dealsgrid/furniture.jpg",
  "https://m.media-amazon.com/images/I/41HJMOkr0GL._AC_UF226,226_FMjpg_.jpg",
  "https://m.media-amazon.com/images/G/31/img20/Events/Jup21dealsgrid/home_appliances.jpg",
  "https://m.media-amazon.com/images/G/31/img20/Events/Jup21dealsgrid/grocery.jpg"

];
List<ProductModel>bestProducts=[
  ProductModel(
      id: "1",
      name: "iPad",
      description: "Xiaomi Pad 5| Qualcomm Snapdragon 860| 120Hz Refresh Rate| "
          "6GB, 128GB| 2.5K+ Display (10.95-inch/27.81cm)|1 Billion Colours| "
          "Dolby Vision Atmos| Quad Speakers| Wi-Fi| Gray",
      image: "https://m.media-amazon.com/images/I/41iyajZaN8L._AC_SR160,160_.jpg",
      isFavourite: false,
      price: 35940,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "2",
      name: "Laptop",
      description: " Lenovo Intel IdeaPad Duet 3 (10.3 inches, 4 GB, 128 GB, Wi-Fi) with Windows 11 Pro and Bluetooth Keyboard and Digital Pen""\n"
          "10.3 inch WUXGA display with 340 nits brightness and 96% sRGB Lightweight 2-in-1 detachable device with kickstand with bluetooth keyboard and Lenovo Digital Pen included",
      image: "https://m.media-amazon.com/images/I/41BWTzkJPYS._AC_SR160,160_.jpg",
      isFavourite: false,
      price: 38990,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "3",
      name: "Mobile",
      description: "Redmi A2 (Classic Black, 4GB RAM, 64GB Storage) | Powerful Octa Core G36 Processor | Upto 7GB RAM | Large 16.5 cm HD+ Display with Massive 5000mAh Battery | 2 Years Warranty",
      image: "https://m.media-amazon.com/images/I/41bLD50sZSL._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 17990,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "4",
      name: "Fashion",
      description: "description",
      image: "https://m.media-amazon.com/images/I/B1EBXtru5tL._AC_UF226,226_FMjpg_.png",
      isFavourite: false,

      status: "pending",
      price: 200,
      qty: null
  ),
  ProductModel(
      id: "5",
      name: "Footwears",
      description: "description",
      image: "https://m.media-amazon.com/images/I/41xpUqSRT2L._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 250,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "6",
      name: "Skincare",
      description: "description",
      image: "https://m.media-amazon.com/images/I/51M2I6lUOBL._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 100,
      status: "pending", qty: null
  ),

  ProductModel(
      id: "7",
      name: "Makeup",
      description: "description",
      image: "https://m.media-amazon.com/images/I/51V8hO9J9JL._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 1000,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "8",
      name: "Super Value Deals",
      description: "description",
      image: "https://m.media-amazon.com/images/I/51WJbAX+mzL._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 1500,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "9",
      name: "Storage Devices",
      description: "description",
      image: "https://m.media-amazon.com/images/I/21qvad6Z1oL._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 1500,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "10",
      name: "Home Picks",
      description: "description",
      image: "https://m.media-amazon.com/images/I/51BnWZLjoNL._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 300,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "11",
      name: "Headphones",
      description: "Ant Esports H530 Multi-Platform Pro RGB Gaming Headsetfor PC / PS4 / PS5 / Xbox One / Switch1 with mic, Black Red",
      image: "https://m.media-amazon.com/images/I/31CzC1KxSsL._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 799,
      status: "pending", qty: null
  ),

  ProductModel(
      id: "12",
      name: "Fragnances",
      description: "description",
      image: "https://m.media-amazon.com/images/I/41sQEQUSg6L._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 300,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "13",
      name: "iPads",
      description: "description",
      image: "https://m.media-amazon.com/images/I/31jUKdJdjHL._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 35000,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "14",
      name: "Dell Laptops",
      description: "Dell Vostro 3420 Laptop, Intel Core i3-1115G4, 8GB DDR4 & 256GB SSD, Win 11 + MSO'21, 14.0""\n""35.56Cms FHD WVA AG 250 nits, 15 Month McAfee, Carbon Black, 1.48Kgs",
      image: "https://m.media-amazon.com/images/I/41BPaaLmMxL._AC_UF226,226_FMjpg_.jpg",
      isFavourite: false,
      price: 33000,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "15",
      name: "Refrigerator",
      description: "Samsung 183 L 4 Star Digital Inverter Direct Cool Single Door Refrigerator (RR20C1824CR/HL, Camellia Purple, Base Stand with Drawer 2023 Model)",
      image: "https://rukminim1.flixcart.com/image/200/200/kfeamq80/refrigerator-new/c/t/h/468asmqs-na-marq-by-flipkart-original-imafvufgxpd8bged.jpeg?q=70",
      isFavourite: false,
      price: 12000,
      status: "pending", qty: null
  ),
  ProductModel(
      id: "16",
      name: "Helmet",
      description: "Vega Crux ISI Certified Flip-Up Helmet for Men and Women with Clear Visor(Black, Size:L)""\n"
          "High Impact ABS Material Shell with texture finish.",
      image: "https://rukminim1.flixcart.com/image/200/200/ki3gknk0/helmet/p/4/9/sba-1-cesar-sba-1-cesar-full-face-steelbird-original-imafxyhzwrhqyvcx.jpeg?q=70",
      isFavourite: false,
      price: 1590,
      status: "pending", qty: null
  ),
];
