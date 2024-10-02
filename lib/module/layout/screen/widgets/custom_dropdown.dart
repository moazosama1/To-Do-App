import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/manager/provider_theme.dart';

typedef void OnChange(String? items);

class CustomDropdownBottom extends StatelessWidget {
  List<String> getItems;
  int selected;
  OnChange onChange;
  CustomDropdownBottom( { this.selected = 0,required this.getItems, required this.onChange });
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var theme= Theme.of(context);
    String selectedItems = getItems[selected];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: theme.colorScheme.primary, width: 2)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: theme.colorScheme.primary, width: 2)),
        ),
        hint: Text(
          selectedItems.tr(),
          style: theme.textTheme.bodySmall,
        ),
        items: getItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child:
                      Text(item.tr(), style: theme.textTheme.bodySmall),
                ))
            .toList(),
        onChanged: onChange,
        onSaved: (value) {
          selectedItems = value.toString();
        },
        buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.only(right: 8),
            overlayColor: WidgetStatePropertyAll(
                theme.colorScheme.primary)),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        dropdownStyleData: DropdownStyleData(
            decoration:
                BoxDecoration(color: theme.colorScheme.secondary)),
      ),
    );
  }
}
