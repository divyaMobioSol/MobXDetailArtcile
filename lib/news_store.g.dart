// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewStores on _NewStore, Store {
  late final _$articlesAtom =
      Atom(name: '_NewStore.articles', context: context);

  @override
  List<Articles> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(List<Articles> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$stateAtom = Atom(name: '_NewStore.state', context: context);

  @override
  currentState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(currentState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$fetchArticlesAsyncAction =
      AsyncAction('_NewStore.fetchArticles', context: context);

  @override
  Future<void> fetchArticles() {
    return _$fetchArticlesAsyncAction.run(() => super.fetchArticles());
  }

  @override
  String toString() {
    return '''
articles: ${articles},
state: ${state}
    ''';
  }
}
