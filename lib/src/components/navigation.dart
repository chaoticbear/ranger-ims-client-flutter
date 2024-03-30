import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('Navigation'));

  final StatefulNavigationShell navigationShell;

  List<BottomNavigationBarItem> getRoutes(routeList) {
    return <BottomNavigationBarItem>[
      ...routeList.map(
        (route) =>
            BottomNavigationBarItem(icon: route["icon"], label: route["title"]),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              minWidth: 55.0,
              selectedIndex: navigationShell.currentIndex,
              // Called when one tab is selected
              onDestinationSelected: (int index) {
                navigationShell.goBranch(index);
              },
              labelType: NavigationRailLabelType.all,
              // leading: const Column(
              //   children: [
              //     SizedBox(
              //       height: 8,
              //     ),
              //     // CircleAvatar(
              //     //   radius: 20,
              //     //   child: Icon(Icons.person),
              //     // ),
              //   ],
              // ),
              unselectedLabelTextStyle: const TextStyle(),
              // navigation rail items
              destinations: <NavigationRailDestination>[
                ...routeList.map(
                  (route) => NavigationRailDestination(
                      icon: route["icon"], label: Text(route["title"])),
                )
              ],
            ),
          Expanded(child: navigationShell),
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.indigoAccent,
              // called when one tab is selected
              onTap: (int index) {
                navigationShell.goBranch(index);
              },
              // bottom tab items
              items: <BottomNavigationBarItem>[
                  ...routeList.map(
                    (route) => BottomNavigationBarItem(
                        icon: route["icon"], label: route["title"]),
                  )
                ])
          : null,
    );
  }
}
