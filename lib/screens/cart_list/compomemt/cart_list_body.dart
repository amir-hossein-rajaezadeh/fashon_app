import 'package:animate_do/animate_do.dart';
import 'package:fashon_app/data/app_data.dart';
import 'package:fashon_app/widget/reusable_btn.dart';
import 'package:fashon_app/widget/reusable_cart_forr_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartListBody extends ConsumerWidget {
  const CartListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            color: Colors.red,
            width: size.width,
            height: size.height * 0.6,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: mainList.length,
              itemBuilder: (context, index) {
                var current = mainList[index];
                return Container(
                  margin: const EdgeInsets.all(5),
                  width: size.width,
                  height: size.height * 0.25,
                  color: Colors.pink,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                current.name,
                                style: const TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                );
              },
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
                        child: const ReusbleCareForRow(
                            price: 140, text: "Sub Total")),
                    FadeInUp(
                      duration: const Duration(
                        milliseconds: 450,
                      ),
                      child:
                          const ReusbleCareForRow(price: 150, text: "Shipping"),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(),
                    ),
                    FadeInUp(
                      duration: const Duration(
                        milliseconds: 450,
                      ),
                      child: const ReusbleCareForRow(price: 500, text: "Total"),
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
