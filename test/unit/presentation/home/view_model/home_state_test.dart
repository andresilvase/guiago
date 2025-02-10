import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/presentation/home/view_model/home_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('HomeState', () {
    test('should return a HomeState with the correct values', () {
      final state = HomeState();

      expect(state.selectedFilters, isEmpty);
      expect(state.motelList, isEmpty);
      expect(state.departureOption, 0);
    });

    test('should return a HomeState with the correct values', () {
      final homeState = HomeState(
        selectedFilters: ['filter1', 'filter2'],
        motelList: [Motel(), Motel()],
        departureOption: 0,
      );

      expect(homeState.selectedFilters, ['filter1', 'filter2']);
      expect(homeState.motelList.length, 2);
      expect(homeState.departureOption, 0);
    });

    test('should return a HomeState with the correct values after calling copyWith', () {
      final homeState = HomeState(
        selectedFilters: ['filter1', 'filter2'],
        motelList: [Motel(), Motel()],
        departureOption: 0,
      );
      final newHomeState = homeState.copyWith(
        selectedFilters: ['filter3', 'filter4'],
        motelList: [Motel(), Motel()],
        departureOption: 1,
      );
      expect(newHomeState.selectedFilters, ['filter3', 'filter4']);
      expect(newHomeState.motelList.length, 2);
      expect(newHomeState.departureOption, 1);
    });

    test('should return a HomeState with the correct values after calling copyWith with null values', () {
      final motelList = [Motel(), Motel()];

      final homeState = HomeState(
        selectedFilters: ['filter1', 'filter2'],
        motelList: motelList,
        departureOption: 0,
      );
      final newHomeState = homeState.copyWith(
        selectedFilters: null,
        departureOption: null,
        motelList: null,
      );
      expect(newHomeState.selectedFilters, ['filter1', 'filter2']);
      expect(newHomeState.motelList, motelList);
      expect(newHomeState.departureOption, 0);
    });
  });
}
