import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrbutclone/bloc/classes/class_info_bloc.dart';
import 'package:mrbutclone/model/class/classData.dart';
import 'package:mrbutclone/model/class/classListData.dart';
class Classes extends StatefulWidget {
  @override
  State<Classes> createState() => _ClassesState();
}

const double leftAlign = -1;
const double rightAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _ClassesState extends State<Classes> {
  final ClassInfoBloc _newsBloc = ClassInfoBloc();
  bool showInput= false;
  late double xAlign;
  late Color leftbtn;
  late Color rightbtn;
  List<ClassListData> _offline = [];
  List<ClassListData> _online = [];
  @override
  void initState() {
    _newsBloc.add(GetClassList());
    super.initState();
    xAlign = leftAlign;
    leftbtn = selectedColor;
    rightbtn = normalColor;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      flexibleSpace:  const Image(
        image: AssetImage('assets/image 1.png'),
        height: 90,
        fit: BoxFit.fill,
      ),
      leading: Padding(padding: const EdgeInsets.only(left: 10), child: Image.asset("assets/logo2 2.png", width: 99, height: 39),),
      leadingWidth: 90,
      elevation: 0,
      actions: [
        Ink(width: 35,decoration:const ShapeDecoration(
            color: Colors.grey, shape: CircleBorder())
          , child: IconButton(
              highlightColor: Colors.transparent,
              onPressed: () {
              setState(() {
                showInput=true;
              });
              },
              icon: const Icon(
                CupertinoIcons.search,
                color: Colors.white,
              )),)
      ],
    ),
    body: SingleChildScrollView(
      child: Container( padding: const EdgeInsets.only(right: 7, bottom: 7, left: 7) ,
        color: const Color(0xFFECF3FB),
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        Image.asset('assets/test 1.png', height: 180,width: double.infinity,),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width-50,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: Alignment(xAlign, 0),
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: (MediaQuery.of(context).size.width-50)/2 ,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      xAlign = leftAlign;
                      leftbtn = selectedColor;
                      rightbtn = normalColor;
                    });
                  },
                  child: Align(
                    alignment: const Alignment(-1, 0),
                    child: Container(
                      width: (MediaQuery.of(context).size.width-50) * 0.5,
                      alignment: Alignment.center,
                      child: Text(
                        'Học trực tuyến',
                        style: TextStyle(
                          color: leftbtn,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      xAlign = rightAlign;
                      rightbtn = selectedColor;
                      leftbtn = normalColor;
                    });
                    print(xAlign);
                  },
                  child: Align(
                    alignment: const Alignment(1, 0),
                    child: Container(
                      width: (MediaQuery.of(context).size.width-50) * 0.5,
                      alignment: Alignment.center,
                      child: Text(
                        'Học tại trung tâm',
                        style: TextStyle(
                          color: rightbtn,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Expanded(child: BlocProvider(
          create: (_) => _newsBloc,
          child: BlocListener<ClassInfoBloc, ClassInfoState>(
            listener: (context, state) {
              if (state is ClassError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<ClassInfoBloc, ClassInfoState>(
              builder: (context, state) {
                if (state is ClassInitial) {
                  return _buildLoading();
                } else if (state is ClassLoading) {
                  return _buildLoading();
                } else if (state is ClassLoaded) {
                  return hoctructuyen(context, state.listClassInfo);
                } else if (state is ClassError) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),)

      ],),),
    ),
    );
  }

  showTextField() {
    TextField(
      //onChanged: (value) => onSearch(value),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          prefixIcon: const BackButton(color: Colors.blue,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500
          ),
          hintText: "Tìm kiếm khoá học..."
      ),
    );
  }

  hoctructuyen(BuildContext context, ClassData data) {
    if(data.onlineclasslistdata!.length>0 && data.onlineclasslistdata!=null){
      _online= data.onlineclasslistdata!.where((element) => element.type=="ONLINE_CLASS").toList();
      _offline= data.onlineclasslistdata!.where((element) => element.type=="OFFLINE").toList();

    }
    return GridView.builder(itemCount: xAlign==-1?_online.length:_offline.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 245,),
        itemBuilder: (BuildContext context, int index){
      return Card(shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
        child: Padding(padding: const EdgeInsets.all(7),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(borderRadius: const BorderRadius.all(
                  Radius.circular(15)),
                child: xAlign==-1?_online[index].image == null ? Image.asset(
                    'assets/phg.jpg', height: 90,) : Image.network(
                    _online[index].image!,
height: 90,
                    errorBuilder: (context, error, stackTrace) {
                      print(error);
                      return Image.asset('assets/phg.jpg',
                        height: 90,
                        fit: BoxFit.fill,);
                    }):
                _offline[index].image == null ? Image.asset(
                    'assets/phg.jpg', height: 90,) : Image.network(
                    _offline[index].image!,
                    height: 90,
                    errorBuilder: (context, error, stackTrace) {
                      print(error);
                      return Image.asset('assets/phg.jpg',
                        height: 90,
                        fit: BoxFit.fill,);
                    })
              ),

              Text("GV: " + (xAlign==-1?_online[index].teacherFullName!:_offline[index].teacherFullName!),
                style: const TextStyle(color: Colors.blue),),
            Text( xAlign==-1? _online[index].name!: _offline[index].name!,
             style: const TextStyle(
                 fontWeight: FontWeight.bold, fontSize: 15),
             maxLines: 1,
             overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 6,),

              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Icon(CupertinoIcons.person, size: 16,),
                Text("Sĩ số lớp: "+ (xAlign==-1?_online[index].studentCount!.toString():_offline[index].studentCount!.toString()))
              ],),
              Text(xAlign==-1?_online[index].price!.toString():_offline[index].price!.toString() + " đ/Buổi",
                  style: const TextStyle(color: Colors.orangeAccent)),
              SizedBox(width: 240,
                  child: ElevatedButton(
                    onPressed: () {showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Thông tin đăng ký khoá học',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.center,),
                        content: Wrap(alignment: WrapAlignment.center,children: [
                          Text(xAlign==-1? _online[index].name!: _offline[index].name!.toString(), textAlign: TextAlign.center,),
                          TextField(
                            //onChanged: (value) => onSearch(value),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5),
                                prefixIcon: Icon(CupertinoIcons.person_circle,color: Colors.blue,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade500
                                ),
                                hintText: "Họ tên phụ huynh"
                            ),
                          ),
                          SizedBox(height: 60,),
                          TextField(
                            //onChanged: (value) => onSearch(value),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5),
                                prefixIcon: Icon(CupertinoIcons.phone_circle,color: Colors.blue,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade500
                                ),
                                hintText: "Số điện thoại"
                            ),
                          ),
                          SizedBox(height: 60,),
                          TextField(
                            //onChanged: (value) => onSearch(value),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5),
                                prefixIcon: Icon(Icons.email,color: Colors.blue,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade500
                                ),
                                hintText: "Email"
                            ),
                          ),
                        ],),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Huỷ'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('GỬI',style: TextStyle(color: Colors.orange),),
                          ),
                        ],
                      ),
                    );}, child: const Text("Đăng ký"),)),
            ],
          ),),);

    });
  }
  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
