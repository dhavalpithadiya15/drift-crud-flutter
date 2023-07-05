import 'package:drift/drift.dart';

class UserTable extends Table {
  IntColumn get id => integer().autoIncrement().named('id')();

  TextColumn get firstName => text().named('first_name')();

  TextColumn get lastName => text().named('last_name')();

  IntColumn get age => integer().named('age')();

  TextColumn get occupation => text().named('occupation')();

  TextColumn get dateOfBirth => text().named('date_of_birth')();
}
