import 'package:chat_try_3/blocs/chat%20bloc/chat%20cubit.dart';
import 'package:chat_try_3/firebase_options.dart';
import 'package:chat_try_3/screens/chat%20screen.dart';
import 'package:chat_try_3/screens/login%20screen.dart';
import 'package:chat_try_3/screens/map%20screen.dart';
import 'package:chat_try_3/screens/register%20screen.dart';
import 'package:chat_try_3/screens/users%20screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChatCubit(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const MapScreen(),
      ),
    );
  }
}
