import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/manager/provider_auth_account.dart';

typedef Validator = void Function(String?);

class CustomTextFromFieldPassword extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  final ThemeData theme;
  CustomTextFromFieldPassword({
    required this.theme,
    required this.hintText,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderAuthAccount>(
      builder: (context, provider, child) {
        return TextFormField(
          validator:(value) =>  provider.validatePassword(value),
          controller: controller,
          cursorColor: theme.colorScheme.inversePrimary,
          obscureText: provider.secure,
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
              suffixIcon: InkWell(
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                onTap: provider.obSecure,
                child: provider.secure
                    ? const Icon(Icons.visibility ,color: Colors.grey,)
                    : const Icon(Icons.visibility_off , color: Colors.grey,),
              )),
        );
      },
    );
  }
}
