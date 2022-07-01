import 'package:mobx/mobx.dart';
import 'package:news_app2/enum.dart';
import 'package:news_app2/http/http_methods.dart';

import 'model/articles.dart';

part 'news_store.g.dart';

class NewStores = _NewStore with _$NewStores;

abstract class _NewStore with Store {
  @observable
  List<Articles> articles = [];

  @observable
  currentState state = currentState.loading;

  @action
  Future<void> fetchArticles() async {
    try {
      const url =
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=1bfba80a852a4a36b61239f758f97cb5';
      state = currentState.loading;
      var res = await HttpMethods.getHttpMethods(url);
      print(res);
      if (res == null) {
        state = currentState.empty;
      } else {
        articles = (res["articles"] as List)
            .map((json) => Articles.fromJson(json))
            .toList();
        if (articles.isEmpty) {
          state = currentState.empty;
        } else {
          state = currentState.dataRecieved;
        }
      }
    } catch (e) {
      state = currentState.error;
      print(e.toString());
    }
  }
}
