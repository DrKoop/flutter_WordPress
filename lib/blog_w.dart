import 'package:flutter/material.dart';
import 'package:flutter_drk_woocommerce/api/wordpress.dart';
import 'package:flutter_drk_woocommerce/navbar.dart';
import 'dart:core';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:flutter_drk_woocommerce/screens/posts.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class BlogWordPress extends StatelessWidget {

  static const routeName = 'home-blog';

  const BlogWordPress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar( title : Text('Blog - Ultímas Entradas')),
      body: FutureBuilder(
        future: blog(),
        builder:(context, snapshot){
            var posts = snapshot.data;
            if(snapshot.hasData){
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: posts!.length,
                itemBuilder: (context , index){
                  Map post = snapshot.data![index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(DetailPost.routeName, arguments: post ),
                    child: Column(
                      children: [
                        FadeInImage(
                          placeholder: AssetImage('assets/dr2.png'),
                           image: NetworkImage(post['_embedded']['wp:featuredmedia'][0]['media_details']['sizes']['medium']['source_url'], ),
                           ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              HtmlWidget(post['title']['rendered'] , textStyle: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold)),
                              Text(post['content']['rendered'], maxLines: 5),
                            ],
                          ),
                        ),
                      ],
                      ),
                  );
                  }
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
        } ,
      ),
    );
  }
}