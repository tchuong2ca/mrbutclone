import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mrbutclone/model/data.dart';
import 'package:mrbutclone/repository/course_repository.dart';
part 'courses_event.dart';
part 'courses_state.dart';


class CoursesBloc extends Bloc<CourseEvent, CourseState> {
  Data? coursesData;
  CoursesBloc() : super(CourseInitial())
  {
    final CourseRepository courseRepository = CourseRepository();
    on<GetCourseList>((event, emit) async {
      try {
        emit(CourseLoading());
        final mList = await courseRepository.getAllCourses();
        coursesData=Data.fromJson(mList.data['data']);
        emit(CourseLoaded(coursesData!));
      } on NetworkError {
        emit(const CourseError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
class NetworkError extends Error {}