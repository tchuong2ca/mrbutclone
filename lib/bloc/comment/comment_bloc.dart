import 'package:mrbutclone/model/comment/commentData.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/commentRepository.dart';
part 'comment_event.dart';
part 'comment_state.dart';


class CommentBloc extends Bloc<CommentEvent, CommentState> {
  List<CommentData>? commentData;
  CommentBloc() : super(CommentInitial())
  {
    final CommentRepository blogRepository = CommentRepository();
    on<GetCommentList>((event, emit) async {
      try {
        emit(CommentLoading());
        final mList = await blogRepository.getAllComment();
        commentData = List.from(mList.data['data'] ?? []).map((item) {
          return CommentData.fromJson(item as Map<String, dynamic>);
        }).toList();
        emit(CommentLoaded(commentData!));

      } on NetworkError {
        emit(const CommentError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
class NetworkError extends Error {}