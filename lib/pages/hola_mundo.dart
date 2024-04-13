import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/side_menu.dart';
import '../widgets/styles_widgets.dart';

class prueba extends StatefulWidget {
  const prueba({super.key});

  @override
  State<prueba> createState() => _pruebaState();
}

class _pruebaState extends State<prueba>{




  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer:SideMenu(),
      appBar: AppBar(
        title: Text(
          'Hola Mundo',
          style:Styles.appbar,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          Icon(Icons.alarm_add,color:Colors.red,size:50),
          Padding(padding: EdgeInsets.only(right:10))
        ],
      ),
        body:SafeArea(
          child:Center(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[

                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Text("Prueba1",style:Styles.style1),
                    Text("Prueba1",style:Styles.style1),


                  ],
                ),
                Column(
                  children:[
                    Text("Prueba1",style:Styles.style1),
                    Text("Prueba1",style:Styles.style1),


                  ],
                )








              ],
            ),
          ),
        )
      
    );
  }
}
