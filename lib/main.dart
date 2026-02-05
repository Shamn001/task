import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:test/auth/controllers/auth_controller.dart';
import 'package:test/users/controllers/user_controller.dart';
import 'package:test/users/models/user_model.dart';
import 'package:test/users/views/home/home.dart';
import 'auth/views/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');

  runApp(
    ChangeNotifierProvider(
      create: (_) => UserController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: Consumer<AuthController>(
        builder: (context, controller, _) {
          return controller.phone != null ? const HomeView() : AuthPage();
        },
      ),
    );
  }
}
