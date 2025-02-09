import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/providers/app_providers.dart';
import 'package:guiago/core/repositories/repository.dart';

class HomeViewModel extends StateNotifier<List<Motel>> {
  HomeViewModel({required this.ref, required this.repository}) : super([]);

  final Repository repository;
  Ref ref;

  Future<void> fetchData() async {
    final hasInternet = ref.read(appStateProvider).hasInternetConnection;

    final motelList = await repository.getMotelList(hasInternet);

    state = motelList;
  }
}
