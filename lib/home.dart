import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrbutclone/courses.dart';
import 'package:mrbutclone/model/commentData.dart';
import 'package:mrbutclone/model/courses.dart';
import 'package:mrbutclone/model/listData.dart';

import 'model/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
Data? data;
List<CommentData>? commentData;
List<ListData> _listCap1 = [];
List<ListData> _listCap2 = [];
List<ListData> _listCap3 = [];
bool _callApi = true;

  bool _isResult = false;
  // Map<String, dynamic> params = {
  //   "fromRawGrade": '1',
  //   "toRawGrade":'5'//bool
  // };

  Future getApi() async{
    try{
      Response response = await Dio(BaseOptions(
        baseUrl: 'http://api.ongbut.edu.vn',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          'Accept':'*/*',
          'Accept-Encoding':'gzip, deflate, br',
          'Connection':'keep-alive'
        },
          //queryParameters: params
      )).get('/api/v1/public/search-courses');

      Response review = await Dio(BaseOptions(
        baseUrl: 'http://api.ongbut.edu.vn',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          'Accept':'*/*',
          'Accept-Encoding':'gzip, deflate, br',
          'Connection':'keep-alive'
        },
        //queryParameters: params
      )).get('/api/v1/public/comment/course');

      data= Data.fromJson(response.data['data']);
      print(data?.listData);
      if(data!.listData!.length>0&&data!.listData!=null){
        _isResult = true;
        _listCap1 = data!.listData!.where((element) => element.cap=="1").toList();
        _listCap2 = data!.listData!.where((element) => element.cap=="2").toList();
        _listCap3 = data!.listData!.where((element) => element.cap=="3").toList();
        setState(() {

        });
      }

      commentData = List.from(review.data['data'] ?? []).map((item) {
        return CommentData.fromJson(item as Map<String, dynamic>);}).toList();
      _callApi=false;
    }catch(e){
      throw(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if(_callApi){
      getApi();
    }


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
          IconButton(
              onPressed: () {print("clicked");},
              icon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ))
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
                            child: const Text(
                              "50000+ thành viên đăng ký",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                              child: Image.asset(
                                "assets/phg.jpg",
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
                            child: const Text(
                              "13+ năm kinh nghiệm phát triển học trực tuyến",
                              maxLines: 4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                              child: Image.asset(
                                "assets/phg.jpg",
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
                            child: const Text(
                              "Nền tảng khoá học số 1 Việt Nam",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                              child: Image.asset(
                                "assets/phg.jpg",
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
              Row(children: [
                const SizedBox(width: 7,),
                const Text("Tiểu học", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), ),
                const Spacer(),
                TextButton( child: const Text("Xem thêm »", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),onPressed: (){},),
                const SizedBox(width: 7,),
              ],),
              _isResult?SizedBox(height: 300,child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listCap1.length, itemBuilder: (context, index){
                return Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(padding: const EdgeInsets.all(7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image.network(_listCap1[index].image! ,width: 240, height: 140,fit: BoxFit.fill,),),
                  SizedBox(width: 240,child: Text(_listCap1[index].name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),maxLines: 1,overflow: TextOverflow.ellipsis,),),
                  const SizedBox(height: 10,),
                    Text(_listCap1[index].keyword!),
                    Text("GV: "+_listCap1[index].teacherFullName!, style: const TextStyle(color: Colors.blue),),
                    Text(_listCap1[index].price!.toString()  +" đ", style: const TextStyle(color: Colors.orangeAccent)),
                    SizedBox(width: 240,child: ElevatedButton(onPressed: (){}, child: const Text("Đăng ký"),)),
                  ],
                ),),);
              },)):const SizedBox(),
              Row(children: [
                const SizedBox(width: 7,),
                const Text("Trung học cơ sở", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), ),
                const Spacer(),
                TextButton( child: const Text("Xem thêm »", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),onPressed: (){},),
                const SizedBox(width: 7,),
              ],),
              _isResult?SizedBox(height: 300,child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listCap2.length, itemBuilder: (context, index){
                return Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(padding: const EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(15)),
                        child: _listCap2[index].image==null?Image.asset('assets/phg.jpg',width: 240, height: 140,fit: BoxFit.fill,):Image.network(_listCap2[index].image! ,width: 240, height: 140,fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              print(error);
                              return const Center(child: Text("Đéo load được"),);
                            }
                        ),),
                        SizedBox(width: 240,child: Text(_listCap2[index].name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),maxLines: 1,overflow: TextOverflow.ellipsis,),),
                        const SizedBox(height: 10,),
                        Text(_listCap2[index].keyword!),
                        Text("GV: "+_listCap2[index].teacherFullName!, style: const TextStyle(color: Colors.blue),),
                        Text(_listCap2[index].price!.toString()  +" đ", style: const TextStyle(color: Colors.orangeAccent)),
                        SizedBox(width: 240,child: ElevatedButton(onPressed: (){}, child: const Text("Đăng ký"),)),
                      ],
                    ),),);
              },)):const SizedBox(),
              Row(children: [
                const SizedBox(width: 7,),
                const Text("Trung học Phổ thông", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), ),
                const Spacer(),
                TextButton( child: const Text("Xem thêm »", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),onPressed: (){},),
                const SizedBox(width: 7,),
              ],),
              _isResult?SizedBox(height: 300,child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listCap3.length, itemBuilder: (context, index){
                return Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(padding: const EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(15)),
                        child: _listCap3[index].image==null?Image.asset('assets/phg.jpg',width: 240, height: 140,fit: BoxFit.fill,):Image.network(_listCap3[index].image! ,width: 240, height: 140,fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              print(error);
                              return const Center(child: Text("Đéo load được"),);
                            }
                        ),),
                        SizedBox(width: 240,child: Text(_listCap3[index].name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),maxLines: 1,overflow: TextOverflow.ellipsis,),),
                        const SizedBox(height: 10,),
                        _listCap3[index].keyword==null?Text("Không có nhận xét"):Text(_listCap3[index].keyword!),
                        _listCap3[index].teacherFullName==null?Text("GV: "):Text("GV: "+_listCap3[index].teacherFullName!, style: const TextStyle(color: Colors.blue),),
                        Text(_listCap3[index].price!.toString()  +" đ", style: const TextStyle(color: Colors.orangeAccent)),
                        SizedBox(width: 240,child: ElevatedButton(onPressed: (){}, child: const Text("Đăng ký"),)),
                      ],

                    ),),);
              },)):const Text("Chưa có khoá học nào", textAlign: TextAlign.center,),
              Row(children: [
                const SizedBox(width: 7,),
                const Text("Tin tức", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), ),
                const Spacer(),
                TextButton( child: const Text("Xem thêm »", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),onPressed: (){},),
                const SizedBox(width: 7,),
              ],),
              const Text("Chưa có tin tức nào", textAlign: TextAlign.center,style: const TextStyle(color: Colors.grey),),
              const SizedBox(height: 15,),
              Row(children: const [
                SizedBox(width: 7,),
                Text("Nhận xét của phụ huynh", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), ),
              ],),

              _isResult?SizedBox(height: 200,child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: commentData!.length, itemBuilder: (context, index){
                return Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(padding: const EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(children: [
                        ClipRRect(borderRadius: const BorderRadius.all(const Radius.circular(50)),child: Image.network(commentData![index].createUserAvatar!, width: 50,height: 50,fit: BoxFit.fill,),),
                        const SizedBox(width: 8,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                          Text(commentData![index].createUserFullName!, maxLines: 1, overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                          const Text("Phụ huynh", style: const TextStyle(color: Colors.grey)),
                        ],)
                      ],),
                        const SizedBox(height: 10,),
                        SizedBox( width: MediaQuery.of(context).size.width-50, child:  Text(commentData![index].courseName!, maxLines: 1, overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start,),),
                        SizedBox( width: MediaQuery.of(context).size.width-50, child:  Text(commentData![index].content!, maxLines: 2, overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,),),
                      ],
                    ),),);
              },)):const Text("Chưa có khoá học nào", textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}

