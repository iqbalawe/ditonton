import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: const AssetImage('assets/circle-g.png'),
              backgroundColor: Colors.grey.shade900,
            ),
            accountName: const Text('Ditonton'),
            accountEmail: const Text('ditonton@dicoding.com'),
            decoration: BoxDecoration(color: Colors.grey.shade900),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            selected: currentRoute == homeMovieRoute,
            selectedColor: mikadoYellow,
            onTap: () {
              if (currentRoute == homeMovieRoute) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  homeMovieRoute,
                  (route) => false,
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('TV Series'),
            selected: currentRoute == homeTVSeriesRoute,
            selectedColor: mikadoYellow,
            onTap: () {
              if (currentRoute == homeTVSeriesRoute) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  homeTVSeriesRoute,
                  (route) => false,
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Watchlist'),
            selected: currentRoute == watchlistRoute,
            selectedColor: mikadoYellow,
            onTap: () {
              if (currentRoute == watchlistRoute) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamed(context, watchlistRoute);
              }
            },
          ),
          ListTile(
            onTap: () {
              if (currentRoute == aboutRoute) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamed(context, aboutRoute);
              }
            },
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
          ),
        ],
      ),
    );
  }
}
