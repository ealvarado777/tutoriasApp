
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../model/cliente_map.dart';

class ClienteService{

    static String urlApi="";

    static initialize(){
           final apiUrlApi=dotenv.env["LOCAL_JSON"];
           urlApi=apiUrlApi.toString();
    }

    static Future<Map<String, dynamic>> consultarClientes() async {
      await initialize();
      String url1 = "${urlApi}/clientes";
      var url = Uri.parse(url1);
      Map<String, dynamic> mapResponse = {};
      /* var dio = Dio();
    dio.interceptors.add(CustomInterceptor()); */
      try {
        var headers = {
          'Content-Type': 'application/json',
          //"Authorization":"Bearer $token"
        };

        print("url cliente-->" + url1.toString());

        final response = await http.get(
          url,
          headers: headers,
        );

        print("response clientes----->" + response.body.toString());

        if (response.statusCode == 200 || response.statusCode == 400) {
          mapResponse.addAll({"success": true});
          mapResponse
              .addAll({"body": ClienteMap.clienteMapConverter(response.body)});
          return mapResponse;
        }

        mapResponse.addAll({"success": false});
        mapResponse.addAll({"body": response.body});
        return mapResponse;
      } catch (ex, e) {
        print("error-->" + ex.toString());
        mapResponse.addAll({"success": false});
        mapResponse.addAll({"body": ex.toString()});
      }
      return mapResponse;
    }


    /*static Future<Map<String,dynamic>>consultarClientes()async{
      initialize();
      Map<String, dynamic> mapResponse = {};
      String url1=urlApi+"/clientes";
      print("url-->"+url1.toString());
      var url=Uri.parse(url1);

      try{

          var headers={
            'Content-Type': 'application/json',
            //"Authorization":"Bearer $token"
          };

          final response = await http.get(
            url,
            headers: headers,
          );
          print("respsonse clientes-->"+response.body);

          if(response.statusCode==200 || response.statusCode==400){
            mapResponse.addAll({"success":true});
            mapResponse
                .addAll({"body":ClienteMap.clienteMapConverter(response.body)});
            return mapResponse;
          }else{
            mapResponse.addAll({"success":false});
          }
          mapResponse.addAll({"body":response.body});


      }catch(ex,e){
         print(e);
        mapResponse.addAll({"success":false});
        mapResponse.addAll({"body":ex.toString()});


      }


        return mapResponse;
    }*/




}