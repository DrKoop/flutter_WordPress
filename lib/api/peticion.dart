import 'dart:convert';
import 'package:http/http.dart' as http;

final dominio = "https://drkoopdev.com/wp-json/wc/v3/";

final products = "products";

final customer = "consumer_key=ck_293538c427fdb1c335c11410f8b0b4eb0e946854";

final key = "consumer_secret=cs_ad8734b6c95fbd2b4fcbe813bdf8e347dbb343f6";

final ListaProductosWoocommerce = "$dominio$products?$customer&$key";

Future<List> productos() async{

  final  url = ListaProductosWoocommerce;

  final response =  await http.get(Uri.parse(url),headers: {"Accept" : "application/json"});
  print(response);

    var jsonConvert = jsonDecode(response.body);

    return jsonConvert;

}