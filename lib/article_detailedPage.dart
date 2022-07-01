import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/articles.dart';

class ArticleDetailPage extends StatelessWidget {
  Articles articles;

  ArticleDetailPage({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article Details')),
      body: Column(children: [
        Image.network(articles.urlToImage.toString()),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(articles.title.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Text(articles.description.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text(articles.author.toString())),
                  IconButton(
                    icon: Icon(Icons.launch),
                    onPressed: () async {
                      if (await canLaunchUrl(Uri.parse(articles.url!))) {
                        launchUrl(Uri.parse(articles.url!));
                      }
                    },
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(articles.content.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
