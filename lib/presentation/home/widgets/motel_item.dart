import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

class MotelItem extends StatelessWidget {
  const MotelItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GOColors.grey2,
      height: Get.height * .9,
      child: Column(
        children: [
          header(),
          body(),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      color: GOColors.grey2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          logo(),
          info(),
          Spacer(),
          favoriteButton(),
        ],
      ),
    );
  }

  ClipOval logo() {
    return ClipOval(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Container info() {
    return Container(
      margin: EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          motelName(),
          motelAddress(),
          motelRatings(),
        ],
      ),
    );
  }

  Text motelName() {
    return Text(
      'motel savanas',
      style: TextStyle(
        fontSize: 26,
        color: GOColors.textColor,
        height: 1,
      ),
    );
  }

  Widget motelAddress() {
    return SizedBox(
      width: 200,
      child: Text(
        '9,3km - nossa senhora de lourdes - aparecida de goiânia',
        style: TextStyle(
          color: GOColors.textColor,
          fontSize: 14,
          height: 1,
        ),
      ),
    );
  }

  Widget motelRatings() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        spacing: 8,
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: GOColors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: GOColors.yellow.withValues(alpha: 0.7),
              ),
            ),
            child: Row(
              spacing: 4,
              children: [
                Icon(
                  Icons.star,
                  color: GOColors.yellow,
                  size: 13,
                ),
                Text(
                  '4.3',
                  style: TextStyle(
                    color: GOColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '102 avaliações',
            style: TextStyle(
              color: GOColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              height: 1,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: GOColors.black,
            size: 13,
          ),
        ],
      ),
    );
  }

  IconButton favoriteButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.favorite,
        color: GOColors.textColor.withValues(alpha: 0.3),
        size: 32,
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          suiteDetails(),
          suiteDetails(),
          suiteDetails(),
        ],
      ),
    );
  }

  Widget suiteDetails() {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: GOColors.grey2,
      ),
      width: Get.width,
      child: Column(
        children: [
          imageAndName(),
          items(),
          timeAndPrice(),
        ],
      ),
    );
  }

  Widget imageAndName() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 1.5, horizontal: 4),
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: GOColors.white,
      child: Column(
        children: [
          image('https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'suíte soft',
                  style: TextStyle(
                    color: GOColors.textColor,
                    fontSize: 24,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Icon(
                        color: GOColors.primaryColor,
                        Icons.notifications_active,
                        size: 14,
                      ),
                    ),
                    Visibility(
                      child: Text(
                        'só mais 2 pelo app',
                        style: TextStyle(
                          color: GOColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget image(String imageUrl) {
    return Container(
      margin: EdgeInsets.all(8),
      height: Get.width / 1.85,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget items() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 1.5, horizontal: 4),
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: GOColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28),
        child: Row(
          children: [
            Icon(Icons.garage),
          ],
        ),
      ),
    );
  }

  Widget timeAndPrice() {
    return Column(
      children: [
        timeAndPriceItem(),
        timeAndPriceItem(),
        timeAndPriceItem(),
      ],
    );
  }

  Widget timeAndPriceItem() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 1.5, horizontal: 4),
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: GOColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28),
        child: Row(
          children: [
            Icon(Icons.garage),
          ],
        ),
      ),
    );
  }
}
