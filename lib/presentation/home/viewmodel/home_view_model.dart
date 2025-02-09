import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/repositories/repository.dart';

class HomeState {
  List<Motel> motelList = [];
  bool isLoading = false;
  bool isError = false;

  void loading() {
    isLoading = true;
    isError = false;
  }

  void loaded(List<Motel> motelList) {
    this.motelList = motelList;
    isLoading = false;
    isError = false;
  }

  void error() {
    isLoading = false;
    isError = true;
  }

  void clear() {
    motelList = [];
    isLoading = false;
    isError = false;
  }
}

class HomeViewModel {
  final Repository repository;
  final HomeState state;

  HomeViewModel({required this.repository, required this.state});

  Future<void> fetchData() async {
    state.loading();
    final response = await repository.getMotelList(true);
    state.loaded(response);
    return;
  }
}
