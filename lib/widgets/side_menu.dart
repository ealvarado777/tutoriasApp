


import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/menu.dart';

class SideMenu extends StatefulWidget{
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu>{

  List<Menu>menus=[];
  Map<String, Widget> iconos = HashMap();

  @override
  void initState(){
    super.initState();
    iconos.addAll(
        {"flecha":const Icon(Icons.keyboard_arrow_right)});
    iconos.addAll(
        {"ac_unit":const Icon(Icons.keyboard_arrow_right)});
    cargarMenus();

  }




  @override
  Widget build(BuildContext context){
    return Drawer(
           child:ListView(
                 children:[

                   DrawerHeader(child:Container(
                        child:Image(image:AssetImage(
                              "assets/images/gds_procamaronex.png"
                        )),
                   )),

                    Column(
                       children:menus.map((menu){

                          return _buildMenuItem(menu);
                       }).toList(),
                    )

                 ],
           ),
    );
  }

  void cargarMenus()async{

    await rootBundle.loadString("lib/util/json_rutas.json").then((v)async{
      menus = menuFromJson(v);
      setState((){

      });
    });
  }



  Widget _buildMenuItem(Menu menu){
    if (menu.children == null || menu.children!.isEmpty) {
      // No children, return ListTile
      return ListTile(
        leading: iconos["${menu.iconoLeading}"],
        trailing: iconos["${menu.iconoTrailing}"],
        title: Text(menu.opcion),
        onTap: () {

          Navigator.of(context).pushNamed(menu.ruta, arguments: true);

        },
      );
    } else {
      // Has children, return ExpansionTile
      return ExpansionTile(
        leading: iconos[
        "${menu.iconoLeading}"], //Icon(_getIconData(menu.iconoLeading)),
        //trailing: Icon(_getIconData(menu.iconoTrailing)),
        title: Text(menu.opcion),
        children: menu.children!
            .map((childMenu) => _buildMenuItem(childMenu))
            .toList(),
      );
    }
  }



}


