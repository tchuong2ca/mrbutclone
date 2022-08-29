part of 'course_detail_bloc.dart';

abstract class CourseDetailState extends Equatable {
  const CourseDetailState();
  @override
  List<Object?> get props => [];
}
class CourseDetailInitial extends CourseDetailState {}
class CourseDetailLoading extends CourseDetailState {}
class CourseDetailLoaded extends CourseDetailState {

  final CourseData coursesData;
  const CourseDetailLoaded(this.coursesData);
}
class CourseDetailError extends CourseDetailState {
  final String? message;
  const CourseDetailError(this.message);
}
