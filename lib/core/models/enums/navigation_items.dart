import 'package:flutter/material.dart';

enum NavigationItems {
  home,
  users,
  // panel,
  // pieChart,
}

extension NavigationItemsExtensions on NavigationItems {
  IconData get icon {
    switch (this) {
      case NavigationItems.home:
        return Icons.home;
      // case NavigationItems.panel:
      //   return Icons.bar_chart;
      // case NavigationItems.pieChart:
      //   return Icons.pie_chart;
      case NavigationItems.users:
        return Icons.person;
      default:
        return Icons.person;
    }
  }

  String get label {
    switch (this) {
      case NavigationItems.home:
        return 'Home';
      // case NavigationItems.panel:
      //   return 'Bar chart';
      // case NavigationItems.pieChart:
      //   return 'Pie chart';
      case NavigationItems.users:
        return 'Profile';
      default:
        return 'Profile';
    }
  }
}

class NavigationButtonModel {
  final String title;
  final IconData icon;
  final bool isActive;
  NavigationButtonModel(
      {required this.title, required this.icon, this.isActive = false});
}

List<NavigationButtonModel> navModel = [
  NavigationButtonModel(title: 'Home', icon: Icons.home),
  NavigationButtonModel(title: 'Bar Chart', icon: Icons.bar_chart),
  // NavigationButtonModel(title: 'Pie Chart', icon: Icons.pie_chart),
  // NavigationButtonModel(title: 'Profile', icon: Icons.person),
];
