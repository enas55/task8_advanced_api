part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class GetCommentsEvent extends CommentEvent {}
