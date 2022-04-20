import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truq_test/UI/profile_screen.dart';
import '../components/text_holder.dart';
import 'Home_screen.dart';
import 'cart_screen.dart';
import 'explorer_screen.dart';

class DashboardHomeScreen extends StatefulWidget {

  @override
  _DashboardHomeScreenState createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> with TickerProviderStateMixin {
  int selectedTab = 2;

  void _selectedTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  void _selectedFab(int index) {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: FABBottomAppBar(
          centerItemText: 'A',
          color: Colors.grey,
          selectedColor: Colors.red,
          notchedShape: const CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          items: [
            FABBottomAppBarItem(name: 'Accueil', iconName: 'assets/svg/home_icon.svg'),
            FABBottomAppBarItem(name: 'Explorer', iconName: 'assets/svg/explorer.svg'),
            FABBottomAppBarItem(name: 'Chariot', iconName: 'assets/svg/cart_icon.svg',),
            FABBottomAppBarItem(name: 'Profile', iconName: 'assets/svg/profile.svg'),
          ], backgroundColor: Colors.white,
        ),
        body: IndexedStack(
          index: selectedTab,
          children: const [
            HomeScreen(),
            ExplorerScreen(),
            CartScreen(),
            ProfileScreen(),
          ],
        ),
    );
  }
}


class FABBottomAppBarItem {
  FABBottomAppBarItem(
      {required this.iconName,
        required this.name,
        this.ignoreActiveColor = false,
        this.ignoreAction});
  String iconName;
  String name;
  bool ignoreActiveColor;
  Function? ignoreAction;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    required this.items,
    required this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    //items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }



  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    int? index = 2,
    ValueChanged<int>? onPressed,
  }) {
    Color color = _selectedIndex == index ? Color(0xFF013A4D) : Color(0xFF8E99AF);
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              onPressed!(item!.ignoreActiveColor ? _selectedIndex : index!);
              if (item.ignoreActiveColor && item.ignoreAction != null) {
                item.ignoreAction!();
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  item!.iconName,
                  height: 24,
                  width: 24,
                  color: color,
                ),
                const SizedBox(
                  height: 2,
                ),
                BurgerText(
                  title: item.name,
                  color: color,
                  size: 11,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}