import 'package:flutter/material.dart';

class HeaderBg extends StatelessWidget {
  Widget child ;
  String imagePath ;
  HeaderBg({super.key , required this.child , required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fitWidth , alignment: Alignment.topCenter )),
      child: child,
    );
  }
}
