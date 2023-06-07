import 'package:avua_assignment/bloc/registration/registration_bloc.dart';
import 'package:avua_assignment/model/registration_form/registration_form_model.dart';
import 'package:avua_assignment/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';

import 'bloc/forms/forms_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //here it will initialize the hive database
  await Hive.initFlutter();

  Hive.registerAdapter(RegistrationFormModelAdapter());
  // if (!Hive.isAdapterRegistered(RegistrationFormModelAdapter().typeId)) {
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegistrationBloc(),
        ),
        BlocProvider(
          create: (context) => FormsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
