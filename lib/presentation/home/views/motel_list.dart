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
    final homeViewModel = ref.read(homeViewModelProvider.notifier);

    return Container(
      color: GOColors.grey2,
      child: FutureBuilder(
        future: homeViewModel.fetchData(),
        builder: (context, snapshot) {
          return switch (snapshot.connectionState) {
            ConnectionState.waiting => const Center(child: CircularProgressIndicator()),
            ConnectionState.done => buildList(ref.read(homeViewModelProvider).motelList),
            _ => const Center(
                child: Text(
                  'Erro ao carregar os dados',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 300,
                  ),
                ),
              ),
          };
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
