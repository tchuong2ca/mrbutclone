import 'package:bloc/bloc.dart';
import 'package:mrbutclone/model/class/classData.dart';
import 'package:equatable/equatable.dart';
import 'package:mrbutclone/repository/class_repository.dart';
part 'class_info_event.dart';
part 'class_info_state.dart';

class ClassInfoBloc extends Bloc<ClassInfoEvent, ClassInfoState> {
   ClassData? classData;
  ClassInfoBloc() : super(ClassInitial())
  {
  final ClassRepository classRepository = ClassRepository();
    on<GetClassList>((event, emit) async {
      try {
        emit(ClassLoading());
        final mList = await classRepository.getAllClass();
        classData=ClassData.fromJson(mList.data['data']);
        emit(ClassLoaded(classData!));
        if (classData!.error!.isNotEmpty) {
          emit(ClassError(classData!.error));
        }
      } on NetworkError {
        emit(const ClassError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
class NetworkError extends Error {}