import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'message_page.dart';
import 'contact_page.dart';
import 'discovery.dart';
import 'mine_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BottonNavBarFramework();
  }
}

class BottonNavBarFramework extends StatefulWidget {
  const BottonNavBarFramework({Key? key}) : super(key: key);

  @override
  _BottonNavBarFrameworkState createState() => _BottonNavBarFrameworkState();
}

class _BottonNavBarFrameworkState extends State<BottonNavBarFramework> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
      onItemSelected: (int i) {
        // ignore: avoid_print
        print(
            "select index: $i"); // This is required to update the nav bar if Android back button is pressed
      },
    );
  }

  List<Widget> _buildScreens() {
    return [
      const MessagesPage(),
      const ContactsPage(),
      const DiscoveryPage(),
      const MinePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.messenger),
        title: ("??????"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.contact_phone),
        title: ("?????????"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.navigation),
        title: ("??????"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("???"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.black,
      ),
    ];
  }
}
