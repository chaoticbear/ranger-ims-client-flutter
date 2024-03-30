import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/app_bar_wrapper.dart';
import 'components/navigation.dart';
import 'routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode themeMode = ThemeMode.system;

  bool get useLightMode => switch (themeMode) {
        ThemeMode.system =>
          View.of(context).platformDispatcher.platformBrightness ==
              Brightness.light,
        ThemeMode.light => true,
        ThemeMode.dark => false
      };

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  List<StatefulShellBranch> getRoutes(routeList) {
    return <StatefulShellBranch>[
      ...routeList.map((route) => StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: route["path"],
                builder: (BuildContext context, GoRouterState state) {
                  return AppBarWrapper(
                      title: route["title"],
                      handleBrightnessChange: handleBrightnessChange,
                      child: route["screen"]);
                },
              ),
            ],
          ))
    ];
  }

  late final _routes = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: "/",
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return Navigation(
              navigationShell: navigationShell,
            );
          },
          branches: getRoutes(routeList),
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routes,
      debugShowCheckedModeBanner: false,
      title: 'Rangers',
      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
    );
  }
}
