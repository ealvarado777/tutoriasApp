
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorias/util/loading_overlay.dart';
import 'package:tutorias/util/msj_toast.dart';
import '../services/cliente_service.dart';


class ClienteViewModel extends ChangeNotifier{

  List<Map<String,dynamic>>clientes=[];

  List<Map<String,dynamic>>copiaclientes=[];

  ClienteViewModel._internal();

  static final  ClienteViewModel _instance=ClienteViewModel._internal();

  factory ClienteViewModel()=>_instance;

  void init({required BuildContext contextA})async{

    consultarClientes(contextA:contextA);
  }


  void asignarClientes({required List<Map<String,dynamic>>c}){
       clientes=c;
       copiaclientes=c;
       notifyListeners();
  }

  Future<void> consultarClientes({required BuildContext contextA})async{
    LoadingOverlay loadingOverlay = LoadingOverlay();
    loadingOverlay.show(contextA);
    final Map<String, dynamic> body = await ClienteService.consultarClientes();
    loadingOverlay.hide();
    bool success = body["success"];
    dynamic response = body["body"];

    if(!success && response.runtimeType == String){
      ToastMsjWidget.displayMotionToast(contextA,
          mensaje: response.toString(),
          tiempoespera: 5,
          type: ToastType.error,
          onChange:(){});
      notifyListeners();
      return;
    }

    if (!success && response.runtimeType == Map) {
      Map<String, dynamic> mapResponse = response;

      String mensaje = mapResponse.containsKey("message")
          ? mapResponse["message"]
          : response.toString();

      ToastMsjWidget.displayMotionToast(contextA,
          mensaje: mensaje.toString(),
          tiempoespera: 5,
          type: ToastType.error,
          onChange: () {});
      notifyListeners();
      return;
    }
    clientes = response;
    clientes = clientes.reversed.toList();
    copiaclientes = List<Map<String, dynamic>>.from(clientes);
    notifyListeners();
  }


  /*Future<void>consultarClientes({required BuildContext contextA})async{

      LoadingOverlay loadingOverlay=LoadingOverlay();
      loadingOverlay.show(contextA);
      Map<String,dynamic>mapBody=await ClienteService.consultarClientes();

      bool success=mapBody["success"];
      dynamic  response=mapBody["body"];

      if(!success && response.runtimeType == String){
        loadingOverlay.hide();
        ToastMsjWidget.displayMotionToast(contextA,mensaje:response,
            tiempoespera:5,type:ToastType.error,onChange:null);
        return;
      }

      clientes=response;
      clientes=clientes.reversed.toList();
      copiaclientes=List<Map<String, dynamic>>.from(clientes);
      loadingOverlay.hide();
      print("response->"+response);
      notifyListeners();

  }*/










}