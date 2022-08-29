import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize/lang_code.dart';
import 'package:localize/localize.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(padding: const EdgeInsets.all(5),
          child: Row(children: [
            TextButton(onPressed: (){}, child: Text("contact".localize, style: const TextStyle(color: Colors.blue))),
            const Spacer(),
            TextButton(onPressed: (){}, child: Text("forgotpwd".localize, style: const TextStyle(color: Colors.blue),)),
          ],),),
      ),
      body: Center(
        child: Text(
          'Null'.localize,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (Translate().langCode == LangCode.vi) {
              Translate().withDefaultLocale(LangCode.en);
            } else {
              Translate().withDefaultLocale(LangCode.vi);
            }
          });
        },
        tooltip: 'Change language',
        child: const Icon(Icons.change_circle_sharp),
      ),
    );
  }
}
