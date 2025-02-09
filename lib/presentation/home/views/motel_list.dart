import 'package:flutter/material.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

class MotelList extends StatelessWidget {
  const MotelList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        motelItemHeader(),
      ],
    );
  }

  Widget motelItemHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      color: GOColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
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
          ),
          Container(
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
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: GOColors.textColor.withValues(alpha: 0.3),
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  Text motelAddress() {
    return Text(
      'Rua das Flores, 123',
      style: TextStyle(
        color: GOColors.textColor,
        fontSize: 14,
        height: 1,
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
}
