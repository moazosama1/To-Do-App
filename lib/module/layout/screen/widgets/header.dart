import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  String title;
  Header({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).colorScheme.primary,
      width: double.infinity,
      height: mediaQueryHeight * 0.24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(title,
                style: Theme.of(context).textTheme.titleMedium),
          ),
        ],
      ),
    );
  }
}
