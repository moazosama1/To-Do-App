import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/layout/screen/widgets/add_task_bottom_sheet.dart';
import 'package:todo/provider/manager/main_provider.dart';

class LayoutScreen extends StatelessWidget {
  static const String routeName = "Layout";
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => MainProvider()..getUser(),
      child: Selector<MainProvider, int>(
        selector: (p0, p1) => p1.selectedIndex,
        builder: (context, selectedIndex, child) {
          var provider = Provider.of<MainProvider>(context, listen: false);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                color: Theme.of(context).colorScheme.secondary,
                child: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage("assets/images/icons/icon_list.png")), label: "Tasks"),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage("assets/images/icons/icon_settings.png")), label: "Settings"),
                  ],
                  onTap: provider.changePage,
                  currentIndex: selectedIndex,
                ),
              ),
            ),

            floatingActionButton: FloatingActionButton(
              child: const Icon(CupertinoIcons.add, color: Colors.white),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ChangeNotifierProvider.value(
                        value: provider, child: AddNewTask());
                  },
                );
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: provider.pages[selectedIndex],
          );
        },
      ),
    );
  }
}
