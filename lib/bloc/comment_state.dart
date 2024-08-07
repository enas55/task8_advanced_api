part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<dynamic> comments;

  CommentLoaded(this.comments);
}

class CommentError extends CommentState {
  final String message;

  CommentError(this.message);
}
