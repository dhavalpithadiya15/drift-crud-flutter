import 'package:bloc/bloc.dart';
import 'package:drift_crud/src/database/my_database.dart';
import 'package:drift_crud/src/ui/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> showData() async {
    List<UserTableData> temp = List.from(state.dataList);
    temp = await MyDataBase.viewData();
    emit(state.copyWith(dataList: temp));
    print(state.dataList);
  }

  Future<void> deleteData(int id) async {
    await MyDataBase.deleteData(id);
    showData();
  }


}
