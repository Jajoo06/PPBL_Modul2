import 'package:flutter/material.dart';

import 'navigation/app_routes.dart';

void main() {
  runApp(const NusantaraCerdasNav());
}

class NusantaraCerdasNav extends StatelessWidget {
  const NusantaraCerdasNav({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusantara Cerdas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      initialRoute: AppRoutes.beranda,
      routes: AppRoutes.daftarRoute(),
      onGenerateRoute: AppRoutes.bentukRoute,
      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}
