part of 'class_info_bloc.dart';
abstract class ClassInfoState extends Equatable {
  const ClassInfoState();
  @override
  List<Object?> get props => [];
}
class ClassInitial extends ClassInfoState {}
class ClassLoading extends ClassInfoState {}
class ClassLoaded extends ClassInfoState {

  final ClassData listClassInfo;
  const ClassLoaded(this.listClassInfo);
}
class ClassError extends ClassInfoState {
  final String? message;
  const ClassError(this.message);
}
