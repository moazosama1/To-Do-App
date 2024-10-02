import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
typedef ValidatorText = String? Function(String?);
class CustomTextField extends StatelessWidget {
  String title ;
  ValidatorText validatorText;
  TextEditingController textEditingController;
  CustomTextField({required this.title , required this.textEditingController , required this.validatorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      validator: (value) {
        return validatorText(value);
      },
      cursorColor: Theme.of(context).colorScheme.onSecondary,
      style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 20,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xffA9A9A9),
                width: 2
            )
        ),
        hintText: title,
        hintStyle: TextStyle(
            color: const Color(0xffA9A9A9),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.inter().fontFamily),
      ),
    );
  }
}
