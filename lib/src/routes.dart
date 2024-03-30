import 'package:flutter/material.dart';
import 'package:flutter_rangers/src/screens/home_screen.dart';
import 'package:flutter_rangers/src/screens/incident_reports_screen.dart';
import 'package:flutter_rangers/src/screens/settings_screen.dart';

List<Map<String, dynamic>> routeList = [
  {
    "title": "Home",
    "icon": const Icon(Icons.home),
    "path": "/",
    "screen": const HomeScreen()
  },
  {
    "title": "Incidents",
    "icon": const Icon(Icons.feed),
    "path": "/incidents",
    "screen": const IncidentReportsScreen()
  },
  {
    "title": "Incident Reports",
    "icon": const Icon(Icons.feed),
    "path": "/incident-reports",
    "screen": const IncidentReportsScreen()
  },
  {
    "title": "Settings",
    "icon": const Icon(Icons.settings),
    "path": "/settings",
    "screen": const SettingsScreen()
  },
];
