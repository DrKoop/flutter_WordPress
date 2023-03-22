

import 'package:flutter/material.dart';
import 'package:flutter_drk_woocommerce/api/peticion.dart';
import 'package:flutter_drk_woocommerce/navbar.dart';
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class HomePageproducts extends StatelessWidget {
  const HomePageproducts({super.key});

  static const routeName = 'products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos Recientes"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child :Center(child: Text("Productos en Promoción", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),))
          ),
          FutureBuilder(
            future: productos(),
            builder: ( context, snapshot){
              final wp_products = snapshot.data;
              return Column(
                children: [
                  ...?wp_products?.map( ( producto ){
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                              return descripcionProductos(producto);
                          },
                          ));
                      },
                      child: Card(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Image.network(producto['images'][0]['src']),
                              Text(producto['name'] , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold ),),
                              Text("Precio: \$${producto['price']}" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              );
            },  
          )
        ],
      ),
    );
  }

  descripcionProductos(producto) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto['name'] , style:  TextStyle( fontSize: 20),),
      ),
      body: ListView(
        children: [
          Carousel(
            height: 350.0,
            width: 350,
            initialPage: 1,
            allowWrap: false,
            type: Types.slideSwiper,
            indicatorType: IndicatorTypes.bar,
            arrowColor: Colors.black,
            axis: Axis.horizontal,
            showArrow: true,
            children: [
              ...producto['images'].map(
                (img) {
                  return Image.network(img['src']);
                },
              ).toList(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric( vertical : 30.0),
            child: Center(child:  Text("Precio: \$${producto['price']}" , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)) ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child:  HtmlWidget(producto['description'])
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart ) , onPressed: () {
          
        },
      )
    );
  } 

}