import 'package:drift_crud/src/database/my_database.dart';
import 'package:drift_crud/src/ui/insert/insert_cubit.dart';
import 'package:drift_crud/src/ui/insert/insert_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsertView extends StatelessWidget {
  final int? id;

  const InsertView({super.key, this.id});

  static const insert = '/insert';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InsertCubit()..selectData(id),
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<InsertCubit>(context);
        final listOfCommonTextField = [
          CommonTextField(controller: cubit.state.firstNameController, hintText: "Enter your First Name"),
          CommonTextField(controller: cubit.state.lastNameController, hintText: "Enter your Last Name"),
          CommonTextField(
            controller: cubit.state.ageController,
            hintText: "Enter your age",
            textInputType: TextInputType.number,
          ),
          CommonTextField(
            controller: cubit.state.occupationController,
            hintText: "Enter your occupation",
          ),
          CommonTextField(
            readOnly: true,
            controller: cubit.state.dateOfBirthController,
            hintText: "Select your Date of birth",
            onTap: () => cubit.showMyDatePicker(context),
          ),
        ];
        return Scaffold(
          appBar: AppBar(
            title: id != null ? const Text("Update Data") : const Text("Insert Data"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...listOfCommonTextField.map((e) => e),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.submitData(id).then((value) => Navigator.pop(context, true));
                    },
                    child: id != null ? const Text("Update Data") : const Text("Insert Data"),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? textInputType;
  final bool readOnly;
  final VoidCallback? onTap;

  const CommonTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.textInputType,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        onTap: onTap,
        readOnly: readOnly,
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
