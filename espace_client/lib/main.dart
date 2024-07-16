import 'package:espace_client/AppProvider/mainProvider.dart';
import 'package:espace_client/widgets/MyContainer/Views/MyContainerView.dart';
import 'package:espace_client/widgets/LoginPage/Views/NewLoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  /*runApp(
    BlocProvider(
      create: (context) =>
          UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appDataProvider = AppDataProvider();
    return ChangeNotifierProvider(
      create: (context) => appDataProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewLoginScreen(),
      ),
    );
  }
}
