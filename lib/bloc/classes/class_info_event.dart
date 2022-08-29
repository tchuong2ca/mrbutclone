part of 'class_info_bloc.dart';
abstract class ClassInfoEvent extends Equatable {
  const ClassInfoEvent();
  @override
  List<Object> get props => [];
}
class GetClassList extends ClassInfoEvent {}