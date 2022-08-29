part of 'courses_bloc.dart';
abstract class CourseEvent extends Equatable {
  const CourseEvent();
  @override
  List<Object> get props => [];
}
class GetCourseList extends CourseEvent {}