import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/providers/app_providers.dart';
import 'package:guiago/core/repositories/repository.dart';

class HomeState {
  final List<String> selectedFilters;
  final List<Motel> motelList;
  final int departureOption;

  HomeState({
    this.selectedFilters = const [],
    this.motelList = const [],
    this.departureOption = 0,
  });

  HomeState copyWith({
    List<String>? selectedFilters,
    List<Motel>? motelList,
    int? departureOption,
  }) {
    return HomeState(
      departureOption: departureOption ?? this.departureOption,
      selectedFilters: selectedFilters ?? this.selectedFilters,
      motelList: motelList ?? this.motelList,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel({required this.ref, required this.repository}) : super(HomeState());

  final Repository repository;
  Ref ref;

  Future<void> fetchData() async {
    final hasInternet = ref.read(appStateProvider).hasInternetConnection;

    final motelList = await repository.getMotelList(hasInternet);

    state = state.copyWith(motelList: motelList);
  }

  void setDepartureOption() {
    state = state.copyWith(departureOption: state.departureOption == 0 ? 1 : 0);
  }

  void addFilter(String filterOption) {
    if (state.selectedFilters.contains(filterOption)) {
      return;
    }

    state = state.copyWith(selectedFilters: [...state.selectedFilters, filterOption]);
  }

  void removeFilter(String filterOption) {
    if (!state.selectedFilters.contains(filterOption)) {
      return;
    }
    state = state.copyWith(selectedFilters: state.selectedFilters.where((element) => element != filterOption).toList());
  }

  int get selectedFiltersLength => state.selectedFilters.length;
  int get departureOption => state.departureOption;
}
