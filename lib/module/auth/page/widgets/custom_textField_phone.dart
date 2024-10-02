import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/manager/provider_auth_account.dart';

class CustomTextFromFieldPhone extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  String validateMessage;
  final ThemeData theme;
  CustomTextFromFieldPhone({
    required this.theme,
    required this.validateMessage,
    required this.hintText,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderAuthAccount>(
      builder: (context, provider, child) {
        return TextFormField(
          validator: (value) => provider.validate(value, false, validateMessage),
          controller: controller,
          keyboardType: TextInputType.phone,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          cursorColor: theme.colorScheme.inversePrimary,
          style: TextStyle(
              fontSize: 20,
              color: theme.colorScheme.inversePrimary,
              fontWeight: FontWeight.w600),
          cursorRadius: const Radius.circular(10),
          cursorHeight: 20,
          cursorWidth: 2,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: theme.colorScheme.primary, width: 3),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: theme.colorScheme.primary, width: 3),
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              hintStyle: const TextStyle(
                  color: Color(0xffA9A9A99C),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              hintText: hintText.tr(),
            suffixIcon:const Icon(CupertinoIcons.phone, color: Colors.grey,)
          ),
        );
      },
    );
  }
}
