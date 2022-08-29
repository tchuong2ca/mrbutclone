import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrbutclone/bloc/blog/blog_bloc.dart';
import 'package:mrbutclone/bloc/courses/courses_bloc.dart';
import 'package:mrbutclone/presenter/home_presenter.dart';
import '../bloc/classes/class_info_bloc.dart';
import '../bloc/comment/comment_bloc.dart';
import 'coursesDetails.dart';
import 'package:mrbutclone/model/listData.dart';
import 'package:mrbutclone/ui/coursesTypes.dart';
import 'package:mrbutclone/model/blog/blogData.dart';
import 'package:mrbutclone/model/data.dart';
import 'package:localize/localize.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CoursesBloc _newsBloc = CoursesBloc();
  final BlogBloc _blogBloc = BlogBloc();
  final CommentBloc _commentBloc = CommentBloc();

  @override
  void initState() {
    _newsBloc.add(GetCourseList());
    _blogBloc.add(GetBlogList());
    _commentBloc.add(GetCommentList());
    _presenter = HomePresenter();
    super.initState();
  }
  List<BlogData>? blogdata;
  HomePresenter? _presenter;
  final bool _isResult = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _newsBloc,
      child: BlocBuilder<CoursesBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseInitial) {
            return _buildLoading();
          } else if (state is CourseLoading) {
            return _buildLoading();
          } else if (state is CourseLoaded) {
            _presenter!.filterGrade(state.coursesData.listData!);
            return courses(context, state.coursesData);
          } else if (state is ClassError) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  khoahoc(List<ListData> list) {
    return list.length!=0
        ? SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                coursesDetails(listData: list[index])));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: list[index].image == null
                                ? Image.asset(
                                    'assets/phuongnguyen.png',
                                    width: 240,
                                    height: 140,
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(list[index].image!,
                                    width: 240, height: 140, fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                        child: Image.asset(
                                      'assets/phuongnguyen.png',
                                      width: 240,
                                      height: 140,
                                      fit: BoxFit.fill,
                                    ));
                                  }),
                          ),
                          SizedBox(
                            width: 240,
                            child: list[index].name == null
                                ? Text(
                                    'Null'.localize,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                : Text(
                                    list[index].name!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          list[index].keyword == null ||
                                  list[index].keyword!.isEmpty
                              ? Text(
                                  "Null".localize,
                                  style: const TextStyle(color: Colors.black),
                                )
                              : Text(list[index].keyword!),
                          list[index].teacherFullName == null
                              ? Text("Null".localize)
                              : Text(
                                  "Teacher".localize +
                                      list[index].teacherFullName!,
                                  style: const TextStyle(color: Colors.blue),
                                ),
                          "Price".localize == "Đ"
                              ? Text("${list[index].price!} Đ",
                                  style: const TextStyle(
                                      color: Colors.orangeAccent))
                              : Text(
                                  "${double.parse((list[index].price! / 23000).toStringAsFixed(2))} USD",
                                  style: const TextStyle(
                                      color: Colors.orangeAccent)),
                          SizedBox(
                              width: 240,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text(
                                        'CourseRegisInfo'.localize,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Wrap(
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text(
                                            list[index].name.toString(),
                                            textAlign: TextAlign.center,
                                          ),
                                          TextField(
                                            //onChanged: (value) => onSearch(value),
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.all(5),
                                                prefixIcon: const Icon(
                                                  CupertinoIcons.person_circle,
                                                  color: Colors.blue,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        Colors.grey.shade500),
                                                hintText:
                                                    "parentName".localize),
                                          ),
                                          const SizedBox(
                                            height: 60,
                                          ),
                                          TextField(
                                            //onChanged: (value) => onSearch(value),
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.all(5),
                                                prefixIcon: const Icon(
                                                  CupertinoIcons.phone_circle,
                                                  color: Colors.blue,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        Colors.grey.shade500),
                                                hintText: "phone".localize),
                                          ),
                                          const SizedBox(
                                            height: 60,
                                          ),
                                          TextField(
                                            //onChanged: (value) => onSearch(value),
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.all(5),
                                                prefixIcon: const Icon(
                                                  Icons.email,
                                                  color: Colors.blue,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        Colors.grey.shade500),
                                                hintText: "email".localize),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: Text('cancel'.localize),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: Text(
                                            'send'.localize,
                                            style:
                                                const TextStyle(color: Colors.orange),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Text("register".localize),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))
        : Text(
            "emptyCourse".localize,
            textAlign: TextAlign.center,
          );
  }

  news(BuildContext context, blogData) {
    return _isResult
        ? Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    "news".localize,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    child: Text("more".localize,
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CoursesTypes(blogdata: blogData!)));
                    },
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: blogData!.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: blogData![index].urlImageRepresent ==
                                          null
                                      ? Image.asset(
                                          'assets/phuongnguyen.png',
                                          width: 240,
                                          height: 140,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.network(
                                          blogData![index].urlImageRepresent!,
                                          width: 240,
                                          height: 140,
                                          fit: BoxFit.fill, errorBuilder:
                                              (context, error, stackTrace) {
                                          return Center(
                                              child: Image.asset(
                                            'assets/phuongnguyen.png',
                                            width: 240,
                                            height: 140,
                                            fit: BoxFit.fill,
                                          ));
                                        }),
                                ),
                                SizedBox(
                                  width: 240,
                                  child: blogData![index].title == null
                                      ? Text(
                                          'Null'.localize,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      : Text(
                                          blogData![index].title!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                blogData![index].keyword == null
                                    ? Text("Null".localize)
                                    : Text(
                                        blogData![index].keyword!,
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      ),
                                blogData![index].shortContent == null
                                    ? Text("Null".localize)
                                    : SizedBox(
                                        width: 240,
                                        child: Text(
                                          blogData![index].shortContent!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                              ],
                            ),
                          ),
                        )),
              ),
            ],
          )
        : const SizedBox();
  }

  Widget courses(BuildContext context, Data data) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('assets/image 1.png'),
          height: 90,
          fit: BoxFit.fill,
        ),
        leading: Image.asset("assets/logo2 2.png", width: 99, height: 39),
        leadingWidth: 90,
        elevation: 0,
        actions: [
          Ink(
            width: 35,
            decoration: const ShapeDecoration(
                color: Colors.grey, shape: CircleBorder()),
            child: IconButton(
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CoursesTypes(courses: data.listData!)));
                },
                icon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            color: const Color(0xFFECF3FB),
            child: Column(
              children: [
                CarouselSlider(
                    options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer),
                    items: [
                      Container(
                        margin: const EdgeInsets.only(
                            right: 6.0, left: 6.0, bottom: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: AssetImage("assets/OBJECTS (3).png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //2nd Image of Slider
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://images2.alphacoders.com/969/thumb-1920-969905.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //3rd Image of Slider
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.alphacoders.com/786/thumb-1920-786887.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //4th Image of Slider
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://images7.alphacoders.com/724/thumb-1920-724419.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //5th Image of Slider
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://images6.alphacoders.com/670/thumb-1920-670517.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 150,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 3 - 15,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "card1".localize,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                child: Image.asset(
                                  "assets/Group 8756.png",
                                  fit: BoxFit.fill,
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                        height: 150,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 3 - 15,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "card2".localize,
                                maxLines: 4,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                child: Image.asset(
                                  "assets/Group 8762.png",
                                  fit: BoxFit.fill,
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                        height: 150,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 3 - 15,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "card3".localize,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                child: Image.asset(
                                  "assets/Group 8763.png",
                                  fit: BoxFit.fill,
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "primary".localize,
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      child: Text("more".localize,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CoursesTypes(
                                    courses: _presenter!.listCap1)));
                      },
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                  ],
                ),
                khoahoc(_presenter!.listCap1),
                Row(
                  children: [
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "second".localize,
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      child: Text("more".localize,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CoursesTypes(
                                    courses: _presenter!.listCap2)));
                      },
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                  ],
                ),
                khoahoc(_presenter!.listCap2),
                Row(
                  children: [
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "high".localize,
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      child: Text("more".localize,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CoursesTypes(
                                    courses: _presenter!.listCap3)));
                      },
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                  ],
                ),
                khoahoc(_presenter!.listCap3),
                BlocProvider(
                  create: (_) => _blogBloc,
                  child: BlocListener<BlogBloc, BlogState>(
                    listener: (context, state) {
                      if (state is BlogError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message!),
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<BlogBloc, BlogState>(
                      builder: (context, state) {
                        if (state is BlogInitial) {
                          return _buildLoading();
                        } else if (state is BlogLoading) {
                          return _buildLoading();
                        } else if (state is BlogLoaded) {
                          return news(context, state.blogdata);
                        } else if (state is BlogError) {
                          return Container();
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "review".localize,
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                BlocProvider(
                  create: (_) => _commentBloc,
                  child: BlocBuilder<CommentBloc, CommentState>(
                    builder: (context, state) {
                      if (state is CommentInitial) {
                        return _buildLoading();
                      } else if (state is CommentLoading) {
                        return _buildLoading();
                      } else if (state is CommentLoaded) {
                        return comment(context, state.commentdata);
                      } else if (state is CommentError) {
                        return Container();
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
  Widget comment(BuildContext context, commentdata) {
    return commentdata!.length!=0
        ? SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: commentdata!.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Image.network(
                                commentdata![index].createUserAvatar!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(commentdata![index].createUserFullName!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start),
                                Text("parent".localize,
                                    style: const TextStyle(color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: Text(
                            commentdata![index].courseName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: Text(
                            commentdata![index].content!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
        : Text(
            "emptyReview".localize,
            textAlign: TextAlign.center,
          );
  }
  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
