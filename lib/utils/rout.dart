import 'package:fashon_app/screens/detail/detail_page.dart';
import 'package:flutter/cupertino.dart';

import '../screens/main/main_wrapper.dart';

class AppRout {
  static final Map<String, WidgetBuilder> routes = {
    '/main': (context) => const MainWrapper(),
    '/detail': (context) => const DetailPage(),
  };
}
