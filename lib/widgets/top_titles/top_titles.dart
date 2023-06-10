import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title;
  final String subtitle;
  const TopTitles({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [const SizedBox(height: kToolbarHeight + 12,),

      if(title=="Login" || title=="Create Account")

        GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
            )),
      const SizedBox(
        height: 12,
      ),
      Text(title,style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),),
      const SizedBox(height: 20,),
      Text(subtitle,style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold
      ),),],
    );
  }
}
