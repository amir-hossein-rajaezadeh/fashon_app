import 'package:animate_do/animate_do.dart';
import 'package:fashon_app/base/base_view_model.dart';
import 'package:fashon_app/screens/detail/view_model/detail_view_model.dart';
import 'package:fashon_app/utils/constants.dart';
import 'package:fashon_app/widget/reusable_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widget/resuable_text.dart';

class DetailBody extends ConsumerWidget {
  const DetailBody(
      {Key? key, required this.data, required this.isFromMostPopulor})
      : super(key: key);
  final BaseViewModelOffline data;
  final bool isFromMostPopulor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    final viewModel = ref.watch(detailViewModelProvider);
    // viewModel.doCalculation();
    return SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                children: [
                  Hero(
                    tag: isFromMostPopulor ? data.imageUrl : data.id,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(data.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: gradient,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.name,
                            style:
                                textTheme.headline3?.copyWith(fontSize: 23),
                          ),
                          ReUsableTextForDetails(text: data.price.toString()),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.006,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.orange,
                          ),
                          Text(
                            data.star.toString(),
                            style: textTheme.headline5,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${data.review}k rewiew",
                            style: textTheme.headline5,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 15,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 18, bottom: 10),
                child: Text(
                  "Select size",
                  style: textTheme.headline3,
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.08,
                // color: Colors.red,
                child: ListView.builder(
                  itemCount: sizes.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    String current = sizes[index];
                    return GestureDetector(
                      onTap: () {
                        viewModel.setSelectedSize(index);
                      },
                      child: AnimatedContainer(
                        margin: const EdgeInsets.all(10),
                        duration: const Duration(milliseconds: 200),
                        width: size.width * 0.12,
                        decoration: BoxDecoration(
                          color: viewModel.getSelectedSize() == index
                              ? primaryColor
                              : Colors.transparent,
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            current,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: viewModel.getSelectedSize() == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(seconds: 800),
              child: SizedBox(
                width: size.width,
                height: size.height * 0.08,
                // color: Colors.red,
                child: ListView.builder(
                  itemCount: colors.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Color current = colors[index];
                    return GestureDetector(
                      onTap: () {
                        viewModel.setSelectedColor(index);
                      },
                      child: AnimatedContainer(
                        margin: const EdgeInsets.all(10),
                        duration: const Duration(milliseconds: 200),
                        width: size.width * 0.12,
                        decoration: BoxDecoration(
                          color: current,
                          border: Border.all(
                            color: viewModel.getSelectedColor() == index
                                ? primaryColor
                                : Colors.transparent,
                            width:
                                viewModel.getSelectedColor() == index ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: ReusableButton(
                  text: "Add to cart",
                  size: size,
                  onTap: () {
                    viewModel.addItemToCarrtList(data, context, true, 0);
                  },
                ),
              ),
            )
          ],
        ),
    );
  }

 
}
