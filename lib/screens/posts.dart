

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class DetailPost extends StatelessWidget {
  const DetailPost({super.key});

  static const routeName = 'detalle';

  @override
  Widget build(BuildContext context) {

    Map post = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(title: Text(post['title']['rendered']),),
      body: ListView(
        children: [
            FadeInImage(
                placeholder: AssetImage('assets/dr2.png'),
                image: NetworkImage(post['_embedded']['wp:featuredmedia'][0]['media_details']['sizes']['medium']['source_url'],),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Text(post['title']['rendered'], style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ))
                ),
            ),
            HtmlWidget(post['content']['rendered'])
        ],
      ),
    );
  }
}