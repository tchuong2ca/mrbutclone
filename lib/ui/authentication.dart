import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize/localize.dart';
class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}
const double leftAlign = -1;
const double rightAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;
class _AuthenticationState extends State<Authentication> {
  late double xAlign;
  late Color leftbtn;
  late Color rightbtn;

  @override
  void initState() {
    super.initState();
    xAlign = rightAlign;
    leftbtn = normalColor;
    rightbtn = selectedColor;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(padding: const EdgeInsets.all(7),
      child: Row(children: [
        TextButton(onPressed: (){}, child: Text("contact".localize, style: const TextStyle(color: Colors.blue))),
        const Spacer(),
        TextButton(onPressed: (){}, child: Text("forgotpwd".localize, style: const TextStyle(color: Colors.blue),)),
      ],),),
    ),
    body: Padding(padding: const EdgeInsets.all(7),
    child: Center(
      child: Column(children: [
        Text("welcome".localize, style: const TextStyle(fontSize: 16, fontFamily: 'Raleway'),),
        SizedBox(height: 40,
          child: Image.asset("assets/image/logo2 2.png"),),
         Container(
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
                      'login'.localize,
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
                      'register'.localize,
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
        TextField(
          //onChanged: (value) => onSearch(value),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(20),),
              hintStyle: TextStyle(
                  fontSize: 16,
                  color:
                  Colors.grey.shade500),
              hintText: "studentname".localize),
        ),
        TextField(
          //onChanged: (value) => onSearch(value),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(20),),
              hintStyle: TextStyle(
                  fontSize: 16,
                  color:
                  Colors.grey.shade500),
              hintText: "dateofbirth".localize),
        ),
        TextField(
          //onChanged: (value) => onSearch(value),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(20),),
              hintStyle: TextStyle(
                  fontSize: 16,
                  color:
                  Colors.grey.shade500),
              hintText: "phone".localize),
        ),
        TextField(
          //onChanged: (value) => onSearch(value),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(20),),
              hintStyle: TextStyle(
                  fontSize: 16,
                  color:
                  Colors.grey.shade500),
              hintText: "email".localize),
        ),
        TextField(
          //onChanged: (value) => onSearch(value),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(20),),
              hintStyle: TextStyle(
                  fontSize: 16,
                  color:
                  Colors.grey.shade500),
              hintText: "password".localize),
        ),
        SizedBox(height: 35,width:MediaQuery.of(context).size.width,child:  ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(25.0),
              ) ), child:  Text('register'.localize),),)
      ].map(
            (e) => Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 10),
          child: e,
        ),
      )
          .toList(),
        ),
    ),),
    );
  }
}
