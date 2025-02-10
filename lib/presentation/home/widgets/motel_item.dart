import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/domain/suites.dart';
import 'package:guiago/presentation/theme/app_theme.dart';
import 'package:intl/intl.dart';

class MotelItem extends StatelessWidget {
  const MotelItem({super.key, required this.motel});

  final Motel motel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GOColors.grey2,
      height: Get.height * .96,
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
              motel.logo ?? '',
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
      motel.fantasia ?? '',
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
        motel.bairro ?? '',
        style: TextStyle(
          color: GOColors.textColor,
          fontSize: 13,
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
                  motel.media.toString(),
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
            '${motel.qtdAvaliacoes} avaliações',
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
        children: motel.suites.map((suite) => suiteDetails(suite)).toList(),
      ),
    );
  }

  Widget suiteDetails(Suites suite) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: GOColors.grey2,
      ),
      width: Get.width,
      child: Column(
        children: [
          imageAndName(
            imageUrl: suite.fotos?.first ?? '',
            name: suite.nome ?? '',
          ),
          items(suite.categoriaItens),
          ...suite.periodos.map(timeAndPriceItem),
        ],
      ),
    );
  }

  Widget imageAndName({required String imageUrl, required String name, int? remainingUnits}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 4),
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
                  name,
                  style: TextStyle(
                    color: GOColors.textColor,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
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

  Widget items(List<SuiteCategoriaItem>? items) {
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
          children: items != null
              ? List.generate(
                  5,
                  (index) {
                    if (index == 4) {
                      return seeAllItems();
                    }
                    return item(items[index]);
                  },
                )
              : [],
        ),
      ),
    );
  }

  Widget item(SuiteCategoriaItem item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: GOColors.grey2,
      ),
      padding: EdgeInsets.all(8),
      child: SizedBox(
        width: 32,
        child: Image.network(
          item.icone ?? '',
          fit: BoxFit.cover,
        ),
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

  Widget timeAndPriceItem(SuitePeriod period) {
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
                  period.tempoFormatado ?? '',
                  style: TextStyle(
                    color: GOColors.textColor,
                    fontSize: 22,
                  ),
                ),
                Text(
                  NumberFormat.currency(
                    locale: 'pt_BR',
                    symbol: 'R\$',
                    decimalDigits: 2,
                  ).format(period.valorTotal),
                  style: TextStyle(
                    color: GOColors.textColor,
                    fontSize: 22,
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
