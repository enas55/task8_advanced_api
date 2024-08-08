import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_advanced_api/bloc/comment_bloc.dart';
import 'package:task8_advanced_api/bloc/post_bloc.dart';
import 'package:task8_advanced_api/pages/home_page.dart';
import 'package:task8_advanced_api/services/api_services.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => PostBloc(ApiService())..add(GetPostsEvent()),
      ),
      BlocProvider(
        create: (context) => CommentBloc(ApiService())..add(GetCommentsEvent()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
