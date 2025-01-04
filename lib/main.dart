import 'package:e_commerce_app/models/cart_models.dart';
import 'package:e_commerce_app/view/bloc/user_sign_in/sign_in_bloc.dart';
import 'package:e_commerce_app/view/bloc/user_sign_up/sign_up_bloc.dart';
import 'package:e_commerce_app/view/cubit/toggle_password/toggle_password_cubit.dart';
import 'package:e_commerce_app/view/user_sign_in/user_signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelsAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => TogglePasswordCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce app',
        theme: ThemeData(),
        home: UserSignInPage(),
      ),
    );
  }
}
