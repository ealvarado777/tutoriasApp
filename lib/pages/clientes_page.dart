
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../view_models/cliente_view_model.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({super.key});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage>{


  @override
  void initState(){
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ClienteViewModel clienteViewModel=ClienteViewModel();
      clienteViewModel.init(contextA:context);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
            appBar:AppBar(
                   title:Text("Clientes"),
                    centerTitle:true,
            ),

    );
  }





}
