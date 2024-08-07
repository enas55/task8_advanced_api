import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_advanced_api/services/api_services.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final ApiService apiServices;

  CommentBloc(this.apiServices) : super(CommentInitial()) {
    on<GetCommentsEvent>(_getComments);
  }

  Future<void> _getComments(
      GetCommentsEvent event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try {
      final comments = await apiServices.getComments();
      emit(CommentLoaded(comments));
    } catch (_) {
      emit(CommentError('Failed to load comments'));
    }
  }
}
