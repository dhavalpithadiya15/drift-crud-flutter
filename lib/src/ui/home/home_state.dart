import 'package:drift_crud/src/database/my_database.dart';

class HomeState {
  final List<UserTableData> dataList;

  const HomeState({
    this.dataList = const [],
  });

  HomeState copyWith({
    List<UserTableData>? dataList,
  }) {
    return HomeState(
      dataList: dataList ?? this.dataList,
    );
  }
}
