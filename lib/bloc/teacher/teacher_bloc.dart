import 'package:mrbutclone/model/teacher/teacherData.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mrbutclone/repository/teacher_repository.dart';
part 'teacher_event.dart';
part 'teacher_state.dart';


class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  TeacherData? teacherData;
  TeacherBloc() : super(TeacherInitial())
  {
    final TeacherRepository teacherRepository = TeacherRepository();
    on<GetTeacherList>((event, emit) async {
      try {
        emit(TeacherLoading());
        final mList = await teacherRepository.getAllTeacher();
        teacherData=TeacherData.fromJson(mList.data['data']);
        //print(teacherData);
        emit(TeacherLoaded(teacherData!));

      } on NetworkError {
        emit(const TeacherError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
class NetworkError extends Error {}