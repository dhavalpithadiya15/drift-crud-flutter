import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:drift_crud/src/database/my_database.dart';
import 'package:drift_crud/src/ui/insert/insert_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InsertCubit extends Cubit<InsertState> {
  InsertCubit()
      : super(
          InsertState(
            firstNameController: TextEditingController(),
            lastNameController: TextEditingController(),
            dateOfBirthController: TextEditingController(),
            ageController: TextEditingController(),
            occupationController: TextEditingController(),
          ),
        );

  Future<void> showMyDatePicker(BuildContext context) async {
    DateTime currentDateTime = DateTime.now();
    print("CURRENT_DATE_TIME => $currentDateTime");
    await showDatePicker(
      context: context,
      initialDate: currentDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        print("SELECTED_DATE => $selectedDate");
        String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
        state.dateOfBirthController.text = "Date : $formattedDate";
        emit(state.copyWith(dateOfBirth: formattedDate));
      }
    });
  }

  Future<int> submitData(int? id) async {
    if (id != null) {
      int age = int.parse(state.ageController.text);
      final user = UserTableCompanion(
        firstName: Value<String>(state.firstNameController.text),
        lastName: Value<String>(state.lastNameController.text),
        age: Value<int>(age),
        occupation: Value<String>(state.occupationController.text),
        dateOfBirth: Value<String>(state.dateOfBirthController.text),
      );
      return await MyDataBase.updateData(user);
    } else {
      int age = int.parse(state.ageController.text);
      final user = UserTableCompanion(
        firstName: Value<String>(state.firstNameController.text),
        lastName: Value<String>(state.lastNameController.text),
        age: Value<int>(age),
        occupation: Value<String>(state.occupationController.text),
        dateOfBirth: Value<String>(state.dateOfBirthController.text),
      );
      return await MyDataBase.insertData(user);
    }
  }

  Future<void> selectData(int? id) async {
    if(id!=null){
      print("++++$id");
      var data = await MyDataBase.selectData(id!);
      print(data);
      print(data);

      for (var e in data) {
        state.firstNameController.text = e.firstName;
        state.lastNameController.text = e.lastName;
        state.dateOfBirthController.text = e.dateOfBirth;
        state.occupationController.text = e.occupation;
        state.ageController.text = e.age.toString();
      }
    }

  }
}
