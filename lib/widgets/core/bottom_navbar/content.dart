part of 'bottom_navbar.dart';

class NavItem {
  final String label;
  final String icon;
  final Widget screen;

  NavItem({required this.label, required this.icon, required this.screen});
}

final List<NavItem> navItems = [
  NavItem(label: "Home", icon: "assets/svgs/home.svg", screen: const Screen1()),
  NavItem(
    label: "Venues",
    icon: "assets/svgs/venues.svg",
    screen: const Screen2(),
  ),
  NavItem(label: "Map", icon: "assets/svgs/map.svg", screen: const Screen3()),
  NavItem(
    label: "Content",
    icon: "assets/svgs/content.svg",
    screen: const Screen4(),
  ),
  NavItem(
    label: "Profile",
    icon: "assets/svgs/profile.svg",
    screen: const Screen5(),
  ),
];

/// Screens

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Home Screen")));
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Venues Screen")));
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Map Screen")));
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Content Screen")));
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Profile Screen")));
  }
}
