import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'compomemt/cart_list_body.dart';

class CartListPage extends ConsumerWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: const CartListBody(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              LineIcons.user,
              color: Colors.black,
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          "MyCart",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      );
  }
}
