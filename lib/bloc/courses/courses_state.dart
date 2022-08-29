part of 'courses_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();
  @override
  List<Object?> get props => [];
}
class CourseInitial extends CourseState {}
class CourseLoading extends CourseState {}
class CourseLoaded extends CourseState {

  final Data coursesData;
  const CourseLoaded(this.coursesData);
}
class CourseError extends CourseState {
  final String? message;
  const CourseError(this.message);
}
