import 'package:cleanapp/config/getit.dart';
import 'package:cleanapp/config/router/app_router.dart';
import 'package:cleanapp/presentation/blocs/user_detail/user_detail_cubit.dart';
import 'package:cleanapp/presentation/blocs/user_list/user_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UserListCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<UserDetailCubit>(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: GenerateRoute.generateRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
