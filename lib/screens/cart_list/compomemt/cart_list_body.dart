import 'package:animate_do/animate_do.dart';
import 'package:fashon_app/data/app_data.dart';
import 'package:fashon_app/screens/cart_list/view_model/cart_list_view_model.dart';
import 'package:fashon_app/screens/detail/view_model/detail_view_model.dart';
import 'package:fashon_app/widget/reusable_btn.dart';
import 'package:fashon_app/widget/reusable_cart_forr_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/constants.dart';

class CartListBody extends ConsumerWidget {
  const CartListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    final viewModel = ref.watch(cartrListViewModelProvider);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.6,
            child: itemOnCart.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: itemOnCart.length,
                    itemBuilder: (context, index) {
                      var current = itemOnCart[index];
                      return FadeInUp(
                        delay: Duration(milliseconds: 100 * index + 80),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: size.width,
                          height: size.height * 0.25,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      image: DecorationImage(
                                          image: AssetImage(current.imageUrl),
                                          fit: BoxFit.cover),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 4,
                                          color: Color.fromARGB(61, 0, 0, 0),
                                        )
                                      ]),
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Text(
                                            current.name,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: "€",
                                              style:
                                                  textTheme.subtitle2?.copyWith(
                                                color: primaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      current.price.toString(),
                                                  style: textTheme.subtitle2
                                                      ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.04,
                                          ),
                                          Text(
                                            "Size = ${sizes[3]}",
                                            style: textTheme.subtitle2
                                                ?.copyWith(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          Container(
                                            width: size.width * 0.4,
                                            height: size.height * 0.04,
                                            margin: EdgeInsets.only(
                                                top: size.height * 0.058),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  width: size.width * 0.065,
                                                  height: size.height * 0.045,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      viewModel
                                                          .increaseOrDecreaseItemToCarrtList(
                                                              current,
                                                              context,
                                                              false,
                                                              index,
                                                              false);
                                                    },
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.grey,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          size.width * 0.02),
                                                  child: Text(
                                                    current.value.toString(),
                                                    style: textTheme.subtitle2
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  width: size.width * 0.065,
                                                  height: size.height * 0.045,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      viewModel
                                                          .increaseOrDecreaseItemToCarrtList(
                                                              current,
                                                              context,
                                                              false,
                                                              index,
                                                              true);
                                                    },
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.grey,
                                                      size: 16,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          viewModel.deleteItem(current);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      );
                    },
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        child: const Image(
                          image: AssetImage("assets/images/empty.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 250),
                        child: const Text(
                          "Your cart is empty right now :(",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 300),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.shopping_bag_outlined),
                        ),
                      )
                    ],
                  ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              width: size.width,
              height: size.height * 0.36,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 12.0),
                child: Column(
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 350),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Stuedent Code voutches",
                            style: textTheme.headline3?.copyWith(fontSize: 16),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    FadeInUp(
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        child: ReusbleCareForRow(
                            price: viewModel.calculateSubTotal().toDouble(),
                            text: "Sub Total")),
                    FadeInUp(
                      duration: const Duration(
                        milliseconds: 450,
                      ),
                      child: ReusbleCareForRow(
                          price: viewModel.doShipping(), text: "Shipping"),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(),
                    ),
                    FadeInUp(
                      duration: const Duration(
                        milliseconds: 450,
                      ),
                      child: ReusbleCareForRow(
                          price: viewModel.doCalculation(), text: "Total"),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 550),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: ReusableButton(
                            text: "Checkout",
                            size: size,
                            onTap: () {
                              Navigator.pushNamed(context, "/cartList");
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
