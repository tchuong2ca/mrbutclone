part of 'course_detail_bloc.dart';
abstract class CourseDetailEvent extends Equatable {
  const CourseDetailEvent();

}
class GetListChapter extends CourseDetailEvent {
  final String id;
  const GetListChapter({
    required this.id
}): assert(id!=null);
  @override
  List<Object> get props => [id];
}