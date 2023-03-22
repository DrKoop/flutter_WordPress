import 'package:flutter/material.dart';
import 'package:flutter_drk_woocommerce/blog_w.dart';
import 'package:flutter_drk_woocommerce/home.dart';
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'api/peticion.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            accountName: Text('Alejandro Rodriguez Sanchez'), 
            accountEmail: Text('Contacto: dr.koop.development@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Center(
                child: ClipOval(
                  child: Image.network('https://scontent.fmex16-1.fna.fbcdn.net/v/t39.30808-6/272105061_109488294966588_1306305701376581674_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=B1UqX_z9oMkAX_zKno7&_nc_ht=scontent.fmex16-1.fna&oh=00_AfAt10jjFUomgukeHMkmAs1kMnW60o9gXgNDNi2XfHrdag&oe=641DF211',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            ),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text('Temas y Productos'),
            onTap: (){
                   Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                         return HomePageproducts();
                        },
                      ));
                      },
          ),
          ListTile(
            leading: Icon(Icons.info_sharp ),
            title: Text('Blog Y Ultimas Noticias'),
            onTap: () => {
                   Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                         return BlogWordPress();
                        },
                      )),
            },
          ),

        ],
      ),
    );
  }

  
}


 