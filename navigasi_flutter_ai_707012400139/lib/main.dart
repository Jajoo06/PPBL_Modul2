import 'package:flutter/material.dart';

import 'navigation/app_routes.dart';

void main() {
  runApp(const AplikasiNavigasi());
}

class AplikasiNavigasi extends StatelessWidget {
  const AplikasiNavigasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      initialRoute: AppRoutes.beranda,
      routes: AppRoutes.daftarRoute(),
      onGenerateRoute: AppRoutes.bentukRoute,
      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}
