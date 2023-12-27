import 'package:agri/app/app.dart';
import 'package:agri/home/widgets/avatar.dart';
import 'package:agri/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(
      selectedIndex,
      curve: Curves.easeOutQuad,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          ),
        ],
      ),
      body: Expanded(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            const UserInfo(),
            Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.grass,
                size: 56,
                color: primaryColor,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.local_shipping,
                size: 56,
                color: primaryColor,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.settings,
                size: 56,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 15),
        color: Colors.white,
        child: SlidingClippedNavBar(
          onButtonPressed: onButtonPressed,
          activeColor: primaryColor,
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              icon: Icons.query_stats,
              title: 'Dashboard',
            ),
            BarItem(
              icon: Icons.grass,
              title: 'Plant',
            ),
            BarItem(
              icon: Icons.local_shipping,
              title: 'Shipping',
            ),
            BarItem(
              icon: Icons.settings,
              title: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Avatar(photo: user.photo),
          const SizedBox(height: 4),
          Text(user.email ?? '', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            user.name ?? '',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
