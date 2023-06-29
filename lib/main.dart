import 'package:cleanapp/config/router/app_router.dart';
import 'package:cleanapp/presentation/blocs/cubit/user_list_cubit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListCubit(),
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerConfig: _appRouter.config(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
