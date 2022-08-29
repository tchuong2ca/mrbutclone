import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mrbutclone/model/blog/blogData.dart';
import 'package:mrbutclone/model/blog/blogResponse.dart';
import 'package:mrbutclone/repository/blog_repository.dart';
part 'blog_event.dart';
part 'blog_state.dart';


class BlogBloc extends Bloc<BlogEvent, BlogState> {
  List<BlogData>? blogdata;
  BlogBloc() : super(BlogInitial())
  {
    final BlogRepository blogRepository = BlogRepository();
    on<GetBlogList>((event, emit) async {
      try {
        emit(BlogLoading());
        final mList = await blogRepository.getAllBlog();
        blogdata = List.from(mList.data['data'] ?? []).map((item) {
          return BlogData.fromJson(item as Map<String, dynamic>);
        }).toList();
        emit(BlogLoaded(blogdata!));

      } on NetworkError {
        emit(const BlogError("Failed to fetch data. is your device online?"));
      }
    });
  }

}
class NetworkError extends Error {}