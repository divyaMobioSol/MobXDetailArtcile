import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app2/article_detailedPage.dart';
import 'package:news_app2/enum.dart';
import 'package:news_app2/news_store.dart';
import 'main.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  NewStores newsStore = NewStores();

  @override
  void initState() {
    newsStore.fetchArticles();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MobX')),
      body: Observer(
        builder: (_) {
          if (newsStore.state == currentState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (newsStore.state == currentState.empty) {
            return const Center(
              child: Text('No data found'),
            );
          }
          if (newsStore.state == currentState.error) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else {
            return ListView.builder(
                itemCount: newsStore.articles.length,
                itemBuilder: ((context, i) {
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTileWidget(
                          newsStore.articles[i].urlToImage.toString(),
                          newsStore.articles[i].title.toString(), () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ArticleDetailPage(
                              articles: newsStore.articles[i]);
                        }));
                      }));
                }));
          }
        },
      ),
    );
  }

  Widget ListTileWidget(
    String imageurl,
    String titletext,
    Function ontap,
  ) {
    return ListTile(
      leading:
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageurl)),
      title: Text(titletext),
      onTap: () {
        ontap();
      },
    );
  }
}
