import 'package:assignment_app/UI/Widgets/custom_app_bar.dart';
import 'package:assignment_app/UI/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'StaticScreens/bookmark.dart';
import 'StaticScreens/drawer.dart';
import 'StaticScreens/star.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController? controller;
  int tabIndex = 0;

  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this, initialIndex: 1);
    controller!.addListener(() {
      setState(() {
        tabIndex = controller!.index;
      });
      //print("Selected Index: " + _controller!.index.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = <Widget>[
      MovieScreen(
        controller: controller,
      ),
      Star(),
      Bookmarks(),
      DrawerScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: items,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie_creation,
              ),
              label: 'Now Playing'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dehaze,
              ),
              label: 'Favorites'),
        ],
      ),
      appBar: CustomAppBar(
        controller: controller,
        selectedIndex: tabIndex,
      ),
    );
  }
}
