import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/detail_page.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detail = '/detail';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {beranda: (context) => const HalamanBeranda()};
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detail) {
      final arguments = settings.arguments;

      if (arguments is Map<String, String>) {
        final judul = arguments['judul'] ?? 'Detail';
        final keterangan = arguments['keterangan'] ?? 'Tidak ada keterangan.';

        return MaterialPageRoute(
          builder: (context) =>
              HalamanDetail(judul: judul, keterangan: keterangan),
        );
      }

      return MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Route Tidak Ditemukan')),
          body: Center(
            child: Text('Arguments untuk halaman detail tidak valid.'),
          ),
        ),
      );
    }

    return null;
  }

  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text('Route Tidak Ditemukan')),
        body: Center(child: Text('Route yang diminta tidak ditemukan.')),
      ),
    );
  }
}
