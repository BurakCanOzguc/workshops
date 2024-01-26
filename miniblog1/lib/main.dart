import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog1/blocs/article_bloc/article_bloc.dart';
import 'package:miniblog1/repositories/article_repository.dart';
import 'package:miniblog1/screens/homepage.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<ArticleBloc>(
      create: (context) => ArticleBloc(
        articleRepository: ArticleRepository(),
      ),
    ),
  ], child: const MaterialApp(home: Homepage())));
}
