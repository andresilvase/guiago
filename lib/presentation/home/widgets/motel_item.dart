import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

class MotelItem extends StatelessWidget {
  const MotelItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GOColors.grey2,
      height: Get.height * .97,
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
          imageAndName(imageUrl: 'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg'),
          items(),
          timeAndPrice(),
        ],
      ),
    );
  }

  Widget imageAndName({required String imageUrl, int? remainingUnits}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: GOColors.white,
      child: Column(
        children: [
          image(imageUrl),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                Visibility(
                  visible: remainingUnits != null,
                  child: Row(
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
                      Text(
                        'só mais ${remainingUnits ?? 1} pelo app',
                        style: TextStyle(
                          color: GOColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
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
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: GOColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            item(Icons.garage),
            item(Icons.kitchen),
            item(Icons.ac_unit),
            item(Icons.wifi),
            seeAllItems(),
          ],
        ),
      ),
    );
  }

  Widget item(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: GOColors.grey2,
      ),
      padding: EdgeInsets.all(8),
      child: Icon(
        icon,
        color: GOColors.grey3,
        size: 32,
      ),
    );
  }

  Widget seeAllItems() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            child: Text(
              'ver todos',
              style: TextStyle(
                color: GOColors.grey3,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: GOColors.textColor,
            size: 13,
          ),
        ],
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
      margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: GOColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 016.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3 horas',
                  style: TextStyle(
                    color: GOColors.textColor,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'R\$ 63,18',
                  style: TextStyle(
                    color: GOColors.textColor,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: GOColors.textColor,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
