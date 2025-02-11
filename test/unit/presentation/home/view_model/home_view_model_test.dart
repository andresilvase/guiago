import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:mockito/mockito.dart';
import 'package:guiago/presentation/home/view_model/home_view_model.dart';

import '../../../../mocks/mocks.mocks.dart';

void main() {
  late MockRepository mockRepository;
  late HomeViewModel homeViewModel;

  setUp(() {
    mockRepository = MockRepository();
    homeViewModel = HomeViewModel(hasInternet: true, repository: mockRepository);
  });

  group('HomeViewModel', () {
    test('fetchData updates state with motelList', () async {
      // Arrange
      final motelList = [Motel(), Motel()];
      when(mockRepository.getMotelList(homeViewModel.hasInternet)).thenAnswer((_) async => motelList);

      // Act
      await homeViewModel.fetchData();

      // Assert
      expect(homeViewModel.state.motelList, motelList);
    });

    test('setDepartureOption toggles departureOption', () {
      // Act
      homeViewModel.setDepartureOption();

      // Assert
      expect(homeViewModel.state.departureOption, 1);

      // Act
      homeViewModel.setDepartureOption();

      // Assert
      expect(homeViewModel.state.departureOption, 0);
    });

    test('addFilter adds a filter to selectedFilters', () {
      // Act
      homeViewModel.addFilter('Free Wifi');

      // Assert
      expect(homeViewModel.state.selectedFilters, ['Free Wifi']);
    });

    test('addFilter does not add a duplicate filter', () {
      // Arrange
      homeViewModel.addFilter('Free Wifi');

      // Act
      homeViewModel.addFilter('Free Wifi');

      // Assert
      expect(homeViewModel.state.selectedFilters, ['Free Wifi']);
    });

    test('removeFilter removes a filter from selectedFilters', () {
      // Arrange
      homeViewModel.addFilter('Free Wifi');

      // Act
      homeViewModel.removeFilter('Free Wifi');

      // Assert
      expect(homeViewModel.state.selectedFilters, []);
    });

    test('removeFilter does not remove a non-existent filter', () {
      // Arrange
      homeViewModel.addFilter('Free Wifi');

      // Act
      homeViewModel.removeFilter('Free Parking');

      // Assert
      expect(homeViewModel.state.selectedFilters, ['Free Wifi']);
    });

    test('selectedFiltersLength returns the correct length', () {
      // Arrange
      homeViewModel.addFilter('Free Wifi');
      homeViewModel.addFilter('Free Parking');

      // Act
      final length = homeViewModel.selectedFiltersLength;

      // Assert
      expect(length, 2);
    });

    test('departureOption returns the correct value', () {
      // Act
      final option = homeViewModel.departureOption;

      // Assert
      expect(option, 0);
    });
  });
}
