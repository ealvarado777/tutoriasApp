

import 'package:flutter/cupertino.dart';
import '../pages/clientes_page.dart';
import '../pages/hola_mundo.dart';

Map<String,Widget Function(BuildContext)>appRoutes={
   "HolaMundo":(_)=>prueba(),
   "Clientes":(_)=>ClientesPage()
};

