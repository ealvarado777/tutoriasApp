import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tutorias/routes/routes.dart';
import 'package:tutorias/view_models/cliente_view_model.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(providers:[

      ChangeNotifierProvider(
        create:(_)=>
            ClienteViewModel(), //QRScan //ShowMasterProvider //ProductoViewModel
      )

    ],
        child:MaterialApp(
          debugShowCheckedModeBanner:false,
          routes:appRoutes,
          initialRoute:"HolaMundo",
        ));

  }


}



