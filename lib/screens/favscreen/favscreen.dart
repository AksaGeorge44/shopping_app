import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/screens/favscreen/widgets/singlefavitem.dart';

import '../../provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider =Provider.of<AppProvider>(context);


    return Scaffold(

      appBar: AppBar(

        title: const Text("FavouriteScreen",style: TextStyle(color: Colors.black),
        ),



      ),

      body: appProvider.getFavouriteProductList.isEmpty?const Center(child: Text("Empty"),
      ):

      Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: appProvider.getFavouriteProductList.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (ctx,index){
              return  SingleFavouriteItem(singleProduct: appProvider.getFavouriteProductList[index],

              );
            }),
      ),
    );
  }
}
