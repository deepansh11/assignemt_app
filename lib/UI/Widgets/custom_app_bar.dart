import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  TabController? controller;
  int selectedIndex = 0;

  CustomAppBar({
    Key? key,
    required this.controller,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(150);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        onTap: (index) {},
        padding: const EdgeInsets.all(15),
        controller: widget.controller,
        tabs: const [
          Tab(
            child: Text(
              'Music',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            child:
                Text('Movies', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Tab(
            child: Text(
              'Shows',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        unselectedLabelColor: Colors.white,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.pink,
            boxShadow: [
              BoxShadow(
                  color: Colors.pink.withOpacity(0.3),
                  blurRadius: 25,
                  offset: Offset(10, 20))
            ]),
      ),
      title: const Text('Deepansh Pahwa'),
      leading: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage('https://picsum.photos/200/300'),
        ),
      ),
      actions: [
        Container(
          width: 130,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      const BorderSide(style: BorderStyle.none, width: 0)),

              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
              fillColor: Colors.grey.shade800,
              // prefixIcon: Icon(
              //   Icons.search,
              //   color: Colors.grey,
              //   size: 20,
              // ),
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }
}
