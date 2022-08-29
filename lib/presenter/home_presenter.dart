import '../model/listData.dart';
import '../model/teacher/teacherListData.dart';

class HomePresenter{
  List<ListData> listCap1 = [];
  List<ListData> listCap2 = [];
  List<ListData> listCap3 = [];
  String imageAvatar='';
  Future<void> filterGrade(List<ListData> dataList) async {
    listCap1 = dataList.where((element) => element.cap == "1").toList();
    listCap2 = dataList.where((element) => element.cap == "2").toList();
    listCap3 = dataList.where((element) => element.cap == "3").toList();
  }
  Future<String> getTeacherAvt(List<TeacherListData> teacherListData, ListData listData)async {
    if (teacherListData.isNotEmpty && teacherListData!= null) {
      try{
        for(TeacherListData t in teacherListData){
          if(t.username == listData.teacherUsername!){
            imageAvatar = t.picture!;
          }
        }
      }
      catch (e){
        imageAvatar ='https://scontent.fhan2-3.fna.fbcdn.net/v/t39.30808-6/273546935_2087344348097614_6861164655646983125_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_ohc=HHnuFSb5fMwAX82Tb2H&_nc_ht=scontent.fhan2-3.fna&oh=00_AT-FdPZK0IBu0Im_fAH5bMMUnEpU1lcTjemHzqj1UuqtvA&oe=630C2A71';
      }
    }
    return imageAvatar;
  }
}