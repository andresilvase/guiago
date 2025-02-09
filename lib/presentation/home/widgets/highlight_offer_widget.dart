import 'package:flutter/material.dart';
import 'package:guiago/presentation/theme/app_theme.dart';
import 'package:guiago/presentation/home/logic/models.dart';
import 'package:guiago/presentation/home/widgets/dots_indicator.dart';
import 'package:intl/intl.dart';

class HighlightOfferWidget extends StatelessWidget {
  const HighlightOfferWidget({super.key, this.offers = const []});

  final List<HighlightOffer> offers;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(viewportFraction: 1);

    return SliverToBoxAdapter(
      child: Visibility(
        visible: offers.isNotEmpty,
        child: Container(
          color: GOColors.grey1,
          padding: EdgeInsets.all(8),
          height: 224,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 184,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: offers.length,
                    itemBuilder: (context, index) {
                      final HighlightOffer highlightOffer = offers[index];

                      return highlightOfferItem(highlightOffer);
                    },
                  ),
                ),
                dotsIndicator(pageController, offers.length),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dotsIndicator(PageController pageController, int length) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(
        child: FittedBox(
          child: DotsIndicator(
            controller: pageController,
            onPageSelected: (int page) {
              pageController.animateToPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                page,
              );
            },
            itemCount: length,
          ),
        ),
      ),
    );
  }

  Widget highlightOfferItem(HighlightOffer highlightOffer) {
    return backgroundCard(
      Row(
        children: [
          offerImage(highlightOffer.imageUrl),
          offerDetails(highlightOffer),
        ],
      ),
    );
  }

  Widget backgroundCard(Widget child) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: GOColors.white,
      elevation: 0.1,
      child: child,
    );
  }

  Container offerImage(String imageUrl) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 162,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        color: Colors.grey,
      ),
    );
  }

  Container offerDetails(HighlightOffer highlightOffer) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      alignment: Alignment.center,
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          offerHeader(title: highlightOffer.title, description: highlightOffer.description),
          offerDiscount(discount: highlightOffer.discountPercentage),
          offerMinPrice(minPrice: highlightOffer.minPrice),
          reserveButton(),
        ],
      ),
    );
  }

  Widget offerHeader({required String title, required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text("🔥", style: TextStyle(fontSize: 22), textAlign: TextAlign.left),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            mainAxisSize: MainAxisSize.min,
            spacing: 0,
            children: [
              offerTitle(title),
              offerDescription(description),
            ],
          ),
        ),
      ],
    );
  }

  Widget offerTitle(String title) {
    return SizedBox(
      width: 200,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: GOColors.textColor,
          fontSize: 16,
          height: 1,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget offerDescription(String description) {
    return SizedBox(
      width: 200,
      child: Text(
        description,
        style: TextStyle(
          color: GOColors.textColor,
          fontSize: 11,
          height: 1,
        ),
        overflow: TextOverflow.clip,
      ),
    );
  }

  Container offerDiscount({required double discount}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 26.0, top: 12.0, bottom: 4.0),
      child: Text(
        "${(discount * 100).toStringAsFixed(0)} % de desconto",
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w600,
          decorationThickness: .3,
          color: GOColors.textColor,
          fontSize: 14,
        ),
      ),
    );
  }

  Padding offerMinPrice({required double minPrice}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        "a partir de ${NumberFormat.currency(locale: "pt_BR").format(minPrice)}",
        style: TextStyle(
          color: GOColors.textColor,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget reserveButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: GOColors.secondaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: [
            Column(
              children: [
                Text(
                  "reservar",
                  style: TextStyle(
                    color: GOColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: GOColors.white,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
