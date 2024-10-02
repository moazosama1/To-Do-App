import 'package:flutter/material.dart';

class BgHeader extends StatelessWidget {
  BgHeader({required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryFixed,
        image:const DecorationImage(image: AssetImage("assets/images/image/auth_background.png" )
          ,fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
