import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_flutterfriends/src/cubit/mix_cubit.dart';
import 'package:workshop_flutterfriends/src/page/mix_page.dart';
import 'package:workshop_flutterfriends/src/repository/dbus_repository.dart';
import 'package:workshop_flutterfriends/src/utils/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => DBusRepository(
        dataSource: DBusDataSource.session(),
      ),
      child: BlocProvider(
        lazy: true,
        create: (context) => MixCubit(
          dBusRepository: context.read<DBusRepository>(),
        ),
        child: MaterialApp(
          title: 'Flutter and Friends Workshop',
          theme: buildTheme(),
          home: const MixPage(),
        ),
      ),
    );
  }
}
