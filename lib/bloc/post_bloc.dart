import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task8_advanced_api/services/api_services.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiService apiServices;

  PostBloc(this.apiServices) : super(PostInitial()) {
    on<GetPostsEvent>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(
      GetPostsEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await apiServices.getPosts();
      emit(PostLoaded(posts));
    } catch (_) {
      emit(PostError('Failed to load posts'));
    }
  }
}
