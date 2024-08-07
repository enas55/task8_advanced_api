import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_advanced_api/bloc/comment_bloc.dart';
import 'package:task8_advanced_api/services/api_services.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentBloc(ApiService())..add(GetCommentsEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Comments')),
        body: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is CommentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentError) {
              return Center(child: Text(state.message));
            } else if (state is CommentLoaded) {
              if (state.comments.isEmpty) {
                return const Center(child: Text('No comments found'));
              } else {
                return ListView.builder(
                  itemCount: state.comments.length,
                  itemBuilder: (context, index) {
                    final comment = state.comments[index];
                    return ListTile(
                      title: Text(comment.name),
                      subtitle: Text(comment.body),
                    );
                  },
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
