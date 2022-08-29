import 'package:flutter/material.dart';
import 'package:mrbutclone/model/blog/blogData.dart';
import 'package:mrbutclone/model/listData.dart';

import 'coursesDetails.dart';

class CoursesTypes extends StatefulWidget {
  List<ListData>? courses;
  List<BlogData>? blogdata;
  CoursesTypes({ this.courses,  this.blogdata}) ;

  @override
  State<CoursesTypes> createState() => _CoursesTypesState();
}

class _CoursesTypesState extends State<CoursesTypes>  {
  List<ListData>? results = [];
  List<BlogData>? results2 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    results = widget.courses;
    results2 = widget.blogdata;
  }
  onSearch(String search) {
    if(results?.length!=null){
      results = widget.courses!.where((name) => name.name!.toLowerCase().contains(search)).toList();
    }
   else {
      results2 = widget.blogdata!.where((name) => name.title!.toLowerCase().contains(search)).toList();
    }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      toolbarHeight: 0,
    ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Padding(padding: const EdgeInsets.only(right: 5, left: 5),
            child: TextField(
              onChanged: (value) => onSearch(value),
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
            ),
          ),

          Expanded(child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: results?.length==null?results2!.length:results!.length, itemBuilder: (context, index) {
            return InkWell(onTap: (){
              results?.length!=null?
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)
                  => coursesDetails(listData: results![index]))):
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)
                  => coursesDetails(blogdata: results2![index])))
              ;
            },child: Card(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
              child: Padding(padding: const EdgeInsets.all(7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ClipRRect(borderRadius: const BorderRadius.all(
                      Radius.circular(15)),
                    child: results?.length==null?
                    results2![index].urlImageRepresent == null ? Image.asset(
                      'assets/phuongnguyen.png', width: 180,
                      height: 140,) : Image.network(
                        results2![index].urlImageRepresent!,
                        width: 180,
                        height: 140,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/phuongnguyen.png', width: 180,
                            height: 140,
                            fit: BoxFit.fill,);
                        })
                    :results![index].image == null ? Image.asset(
                      'assets/phuongnguyen.png', width: 180,
                      height: 140,) : Image.network(
                        results![index].image!,
                        width: 180,
                        height: 140,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/phuongnguyen.png', width: 180,
                            height: 140,
                            fit: BoxFit.fill,);
                        })
                    ,),
                    const SizedBox(width: 15,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start
                      , children: [results?.length==null?
                      results2![index].title!=null?Text(results2![index].title!, style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                        maxLines: 2, overflow: TextOverflow.ellipsis,):const Text("Ko có tiêu đề")
                      :   results![index].name!=null?Text(results![index].name!, style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                      maxLines: 2, overflow: TextOverflow.ellipsis,):const Text("Ko có tên khoá học"),

                      const SizedBox(height: 7,),

                      results?.length==null?
                      results2![index].keyword==null?const Text('Null'):
                      results2![index].keyword!=null?Text(results2![index].keyword!):const Text("Ko có keyword")
                      :  results![index].keyword==null?const Text('Null'):
                      results![index].keyword!=null?Text(results![index].keyword!):const Text("Ko có keyword"),

                      results?.length==null?
                      results2![index].createUser!=null?Text("GV: ${results2![index].createUser!}",
                        style: const TextStyle(color: Colors.blue),):const Text("GV ko có tên")
                      :results![index].teacherUsername!=null?Text("GV: ${results![index].teacherUsername!}",
                        style: const TextStyle(color: Colors.blue),):const Text("GV ko có tên"),

                      results?.length==null?
                      Text("${results2![index].createDate!} đ",
                          style: const TextStyle(color: Colors.orangeAccent))
                      : Text("${results![index].price!} đ",
                          style: const TextStyle(color: Colors.orangeAccent)),

                      ElevatedButton(
                        onPressed: () {}, child: const Text("Đăng ký"),)
                    ],))
                  ],
                ),),)
            );
          },))
        ],),
    );
  }
}




