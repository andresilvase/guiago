import 'package:guiago/core/domain/motel.dart';

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
