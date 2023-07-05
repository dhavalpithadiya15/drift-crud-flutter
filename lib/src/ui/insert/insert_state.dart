import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class InsertState extends Equatable {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController dateOfBirthController;
  final TextEditingController ageController;
  final TextEditingController occupationController;
  final String dateOfBirth;

  @override
  List<Object?> get props => [ dateOfBirth,firstNameController,lastNameController,occupationController,ageController];

  InsertState copyWith({
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? dateOfBirthController,
    TextEditingController? ageController,
    TextEditingController? occupationController,
    String? dateOfBirth,
  }) {
    return InsertState(
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      dateOfBirthController: dateOfBirthController ?? this.dateOfBirthController,
      ageController: ageController ?? this.ageController,
      occupationController: occupationController ?? this.occupationController,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  const InsertState({
    required this.firstNameController,
    required this.lastNameController,
    required this.dateOfBirthController,
    required this.ageController,
    required this.occupationController,
     this.dateOfBirth="",
  });
}
