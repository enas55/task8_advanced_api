import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_advanced_api/bloc/post_bloc.dart';
import 'package:task8_advanced_api/pages/comment_page.dart';
import 'package:task8_advanced_api/services/api_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(ApiService())..add(GetPostsEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Posts')),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostError) {
              return Center(child: Text(state.message));
            } else if (state is PostLoaded) {
              if (state.posts.isEmpty) {
                return const Center(child: Text('No posts found'));
              } else {
                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentPage(postId: post.id),
                        ),
                      ),
                    );
                  },
                );
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
