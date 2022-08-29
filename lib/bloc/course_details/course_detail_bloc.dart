import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/courseList/courseData.dart';
import '../../repository/course_detail_repository.dart';
part 'course_detail_event.dart';
part 'course_detail_state.dart';


class CourseDetailsBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseData? coursesData;
   final CourseDetailRepository coursedetailRepository ;
  CourseDetailsBloc(this.coursedetailRepository) : super(CourseDetailInitial())
  {

    on<GetListChapter>((event, emit) async {
      try {
        final mList = await coursedetailRepository.getDetailsCourse(event.id);
        coursesData=CourseData.fromJson(mList.data['data']);
        emit(CourseDetailLoaded(coursesData!));

      } on NetworkError {
        emit(const CourseDetailError("Failed to fetch data. is your device online?"));
      }
      catch(e){
        print(e);
      }
    });
  }
}
class NetworkError extends Error {}