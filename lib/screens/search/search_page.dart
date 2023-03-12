import 'package:fashon_app/screens/main/view_model/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fashon_app/screens/search/component/search_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        final mainViewModel = ref.watch(mainViewModelProvider);
        mainViewModel.setOnIsSearchMode(true);
        Navigator.pushReplacementNamed(context, "/main");
        return true;
      },
      child: const SafeArea(
        child: Scaffold(
          body: SearchBody(),
        ),
      ),
    );
  }
}
