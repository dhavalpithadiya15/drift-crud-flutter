import 'package:drift_crud/src/routes/routes.dart';
import 'package:drift_crud/src/ui/home/home_cubit.dart';
import 'package:drift_crud/src/ui/home/home_state.dart';
import 'package:drift_crud/src/ui/insert/insert_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String home = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..showData(),
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Drift Crud"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.pushNamed(context, InsertView.insert).then((value) {
                bool? result = value as bool?;
                if (result != null && result) cubit.showData();
              });
            },
          ),
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.dataList.isEmpty) {
                return const Center(
                  child: Text("No data"),
                );
              } else {
                return ListView.builder(
                  itemCount: state.dataList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.dataList[index].firstName),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => cubit.deleteData(state.dataList[index].id),
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await Navigator.pushNamed(context, InsertView.insert,arguments: state.dataList[index].id).then((value) {
                                    bool? result = value as bool?;
                                    if (result != null && result) cubit.showData();
                                  });
                                },
                                icon: const Icon(Icons.update),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        );
      }),
    );
  }
}
