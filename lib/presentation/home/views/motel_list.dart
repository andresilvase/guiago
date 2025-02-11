import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/providers/app_providers.dart';
import 'package:guiago/presentation/home/widgets/motel_item.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

class MotelList extends ConsumerWidget {
  const MotelList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: GOColors.grey2,
      child: FutureBuilder(
        future: ref.read(homeViewModelProvider.notifier).fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar os dados',
                style: TextStyle(color: GOColors.primaryColor),
              ),
            );
          }

          return buildList(ref.read(homeViewModelProvider).motelList);
        },
      ),
    );
  }

  Widget buildList(List<Motel> motelList) {
    return ListView.builder(
      itemCount: motelList.length,
      itemBuilder: (context, index) {
        final motel = motelList[index];
        return MotelItem(motel: motel);
      },
    );
  }
}
