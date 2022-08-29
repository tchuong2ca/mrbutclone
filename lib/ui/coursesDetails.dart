
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrbutclone/bloc/course_details/course_detail_bloc.dart';
import 'package:mrbutclone/bloc/teacher/teacher_bloc.dart';
import 'package:mrbutclone/model/courseList/chapters.dart';
import 'package:mrbutclone/model/courseList/courseData.dart';
import 'package:mrbutclone/model/courseList/listLesson.dart';
import 'package:mrbutclone/model/courseList/listPart.dart';
import 'package:mrbutclone/model/teacher/teacherData.dart';
import 'package:mrbutclone/model/teacher/teacherListData.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mrbutclone/model/listData.dart';

import 'package:mrbutclone/repository/course_detail_repository.dart';

import '../model/blog/blogData.dart';
import '../presenter/home_presenter.dart';
class coursesDetails extends StatefulWidget {
  ListData? listData;
  BlogData? blogdata;
  coursesDetails({this.listData, this.blogdata}) ;

  @override
  State<coursesDetails> createState() => _coursesDetailsState();
}

class _coursesDetailsState extends State<coursesDetails> {
  TeacherData? teacherData;
  List<TeacherListData>? teacherlistData;
  String _imageAvatar='';
  final TeacherBloc teacherBloc = TeacherBloc();
  CourseData? courseData;
  List<Chapters>? chapter;
  List<ListLesson>? listlesson;
  List<ListPart>? listpart;
  HomePresenter? _presenter;
@override
void initState() {
  _presenter = HomePresenter();
teacherBloc.add(GetTeacherList());
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => teacherBloc,
      child: BlocBuilder<TeacherBloc, TeacherState>(
        builder: (context, state) {
          if (state is TeacherInitial) {
            return _buildLoading();
          }
          else if (state is TeacherLoading) {
            return _buildLoading();
          }
          else if (state is TeacherLoaded) {
            _presenter!.getTeacherAvt(state.teacherData.teacherlistdata!, widget.listData!);
            return courseDetail(context, state.teacherData);
          } else if (state is TeacherError) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );

  }
  Widget _buildLoading() =>  Container(color: const Color(0xFFECF3FB),child: const Center(child: CircularProgressIndicator()),);

  Widget courseDetail(BuildContext context,  teacherData) {
    return BlocProvider(
      create: (_) => CourseDetailsBloc(CourseDetailRepository())..add(GetListChapter(id: widget.listData!.courseId!)),
      child: BlocBuilder<CourseDetailsBloc, CourseDetailState>(
        builder: (context, state) {
          if (state is CourseDetailInitial) {
            return _buildLoading();
          }
           else if (state is CourseDetailLoading) {
            return _buildLoading();
          }
          else if (state is CourseDetailLoaded) {
            chapter = state.coursesData.chapters;
            print(chapter!.length);
            return
              Scaffold(appBar: AppBar(
                flexibleSpace: const Image(
                  image: AssetImage('assets/image 1.png'),
                  height: 90,
                  fit: BoxFit.fill,
                ),
                leading: const BackButton(color: Colors.blue,),
                title: const Text("Chi tiết khoá học", style: TextStyle(color: Colors.blue),),
                elevation: 0,
                centerTitle: true,
                actions: const [
                  Icon(Icons.search, color: Colors.blue, size: 25,
                  )
                ],
              ),
                  body: Container(padding: const EdgeInsets.only(right: 7, left: 7),color: const Color(0xFFECF3FB),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                      Expanded(child:
                      ListView.separated(
                        itemBuilder: (context, position) {
                          return position==0?_header():chapter!.isNotEmpty?ExpansionTile(
                            leading: const Icon(CupertinoIcons.clock),
                            title: Text(
                              chapter![position].name!,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            children: [ ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: chapter![position].listLesson!.length,
                              itemBuilder:(context, index1){
                                return Row(mainAxisAlignment: MainAxisAlignment.start ,children: [

                                  const Icon(Icons.circle_outlined, color: Colors.blue,),
                                  const SizedBox(width: 25,),
                                  SizedBox(width: MediaQuery.of(context).size.width*75/100,
                                    child: Text(chapter![position].listLesson![index1].name!,
                                      textAlign: TextAlign.start,maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87),),),
                                  const Spacer(),
                                  const Icon(CupertinoIcons.eye_slash, color: Colors.grey,)
                                ],);}, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 10,); },)],

                          ):const SizedBox();
                        },
                        separatorBuilder: (context, position) {
                          return const Divider();
                        },
                        itemCount: chapter!.isEmpty?chapter!.length+1:chapter!.length,
                      ),
                      )
                      ,Container(height: 70,padding: const EdgeInsets.only(right: 15, left: 15),child: Row(
                        children: [
                          Text(widget.listData!.price!.toString(), style: const TextStyle(color: Colors.blueAccent, fontSize: 20),),
                          const Spacer(),
                          SizedBox(height: 40,width:100,child:  ElevatedButton(onPressed: (){},
                            style: ElevatedButton.styleFrom(primary: Colors.orange,
                                shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(25.0),
                                ) ), child: const Text('Đăng Ký'),),)
                        ],
                      ),)
                    ],),
                  )

              );
          } else if (state is CourseDetailError) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
Widget _header(){
    return Expanded(
      child: Column(children: [
        ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(15)),
          child:
          widget.listData!.image!=null?Image.network(widget.listData!.image!,
              width: MediaQuery.of(context).size.width,
              height: 220,fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                    child: Image.asset(
                      'assets/phuongnguyen.png',
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      fit: BoxFit.fill,
                    ));
              }):
          Image.asset(
            'assets/phuongnguyen.png',
            width: MediaQuery.of(context).size.width,
            height: 220,
            fit: BoxFit.fill,
          ),),
        widget.listData!.name!=null?Text(widget.listData!.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),maxLines: 2, overflow: TextOverflow.ellipsis,):const Text("Null"),
        Row(children: [widget.listData!.keyword==null||widget.listData!.keyword!.isEmpty?const Text("Null"):Text(widget.listData!.keyword!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const Spacer(),
          RatingBarIndicator(
            rating: 5,
            itemCount: 5,
            itemSize: 25.0,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.deepOrangeAccent,
            ),
          ),],),
        Row(children: [
          ElevatedButton.icon(onPressed: (){print(widget.listData!.keyword);},style: ElevatedButton.styleFrom(primary: const Color(0xFFECF3FB)),
              icon: const Icon(Icons.info, color: Colors.blue,),label: const Text("Thông tin chi tiết", style: TextStyle(color: Colors.blue),)),
          const Spacer(),
          TextButton(onPressed: (){}, child: const Text("Nhận xét về khoá học", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),))
        ],),
        Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
          ClipRRect(borderRadius: const BorderRadius.all(
              Radius.circular(50)),
            child: _presenter!.imageAvatar.isNotEmpty?Image.network(
                _presenter!.imageAvatar, width: 50,
                height: 50,
                fit: BoxFit.fill,errorBuilder: (context, error, stackTrace) {
              return  Center(
                child: Image.asset(
                  'assets/phuongnguyen.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),);
            }):Image.asset(
              'assets/phuongnguyen.png',
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),),
          const SizedBox(width: 8,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.listData!.teacherFullName!=null?Text( "GV: ${widget.listData!.teacherFullName!}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start):Text("GV ko có tên"),
              const Text("5 sao",
                  style: TextStyle(color: Colors.grey)),
            ],)
        ],),
      ].map(
        (e) => Padding(
        padding: const EdgeInsets.only(top: 3, bottom: 3),
        child: e,
        ),
        )
            .toList(),),
    );
}
}
