import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_crud/src/database/tables.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:drift/native.dart';

part 'my_database.g.dart';

@DriftDatabase(tables: [UserTable])
class MyDataBase extends _$MyDataBase {
  MyDataBase() : super(openConnection());
  static MyDataBase myDataBase = MyDataBase();

  @override
  int get schemaVersion => 1;

  static Future<int> insertData(UserTableCompanion userTableCompanion) async {
    return await MyDataBase.myDataBase.into(MyDataBase.myDataBase.userTable).insert(userTableCompanion);
  }

  static Future<List<UserTableData>> viewData() {
    return MyDataBase.myDataBase.select(MyDataBase.myDataBase.userTable).get();
  }

  static Future<int> deleteData(int id) {
    return (MyDataBase.myDataBase.delete(myDataBase.userTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  static Future<int> updateData(UserTableCompanion userTableCompanion) async {
    return MyDataBase.myDataBase.update(MyDataBase.myDataBase.userTable).write(userTableCompanion);
  }

  static Future<List<UserTableData>> selectData(int id) async {
    return (MyDataBase.myDataBase.select(MyDataBase.myDataBase.userTable)..where((tbl) => tbl.id.equals(id))).get();
  }
}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
