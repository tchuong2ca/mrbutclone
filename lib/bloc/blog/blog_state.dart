part of 'blog_bloc.dart';
abstract class BlogState extends Equatable {
  const BlogState();
  @override
  List<Object?> get props => [];
}
class BlogInitial extends BlogState {}
class BlogLoading extends BlogState {}
class BlogLoaded extends BlogState {

  final  List<BlogData>? blogdata;
  const BlogLoaded(this.blogdata);
}
class BlogError extends BlogState {
  final String? message;
  const BlogError(this.message);
}
