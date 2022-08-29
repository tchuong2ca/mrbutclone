part of 'teacher_bloc.dart';



abstract class TeacherState extends Equatable {
  const TeacherState();
  @override
  List<Object?> get props => [];
}
class TeacherInitial extends TeacherState {}
class TeacherLoading extends TeacherState {}
class TeacherLoaded extends TeacherState {

  final TeacherData teacherData;
  const TeacherLoaded(this.teacherData);
}
class TeacherError extends TeacherState {
  final String? message;
  const TeacherError(this.message);
}
