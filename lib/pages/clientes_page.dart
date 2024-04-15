
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../view_models/cliente_view_model.dart';
import 'package:provider/provider.dart';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
            appBar:AppBar(
                   title:Text("Clientes"),
                    centerTitle:true,
            ),
            body:SafeArea(child:Column(
                 children:[
                   Consumer<ClienteViewModel>(builder:(context,item,child){
                     return Container(
                       width: size.width,
                       height: size.height/1.3,
                       child: ListView.builder(
                         itemCount: item.clientes.length,
                         itemBuilder: (context, index){
                           Map<String, dynamic> cliente=item.clientes[index];
                           return  Column(
                               children: [
                                 ListTile(
                                   title:Text(cliente["nombres"],style:TextStyle(
                                     color:Colors.black
                                   ),),
                                 ),
                                 Divider()
                               ],
                             );

                         },
                       ),
                     );
                   })

                 ],
            )),
    );
  }





}
