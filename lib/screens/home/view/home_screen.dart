import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insert_app/screens/home/model/stdmodel.dart';
import 'package:insert_app/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  TextEditingController txtname=TextEditingController();
  TextEditingController txtid=TextEditingController();
  TextEditingController txtstd=TextEditingController();

  TextEditingController dtxtname=TextEditingController();
  TextEditingController dtxtid=TextEditingController();
  TextEditingController dtxtstd=TextEditingController();
  Homeprovider? homeprovider;
  @override
  Widget build(BuildContext context) {
    homeprovider = Provider.of<Homeprovider>(context,listen: false);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("App.."),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: txtid,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                hintText: "Add Id",
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: txtname,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Add name",
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: txtstd,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                hintText: "Add std",
              ),
            ),
            SizedBox(height: 10
            ),
            ElevatedButton(onPressed: (){
              stdmodel s1=stdmodel(name: txtname.text,id: txtid.text,std: txtstd.text);
              homeprovider!.adddata(s1);
            }, child: Text("Add"),),
            Consumer<Homeprovider>(
              builder: (context, value, child) =>
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            spreadRadius: 2,

                          ),

                        ],
                      ),
                      child: ListTile(
                        leading: Text("${homeprovider!.l1[index].id}"),
                        title: Text("${homeprovider!.l1[index].name}"),
                        subtitle: Text("${homeprovider!.l1[index].std}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){
                              homeprovider!.delet(index);
                            }, icon: Icon(Icons.delete),color: Colors.red,),
                           IconButton(onPressed: (){
                             dtxtid=TextEditingController(text: homeprovider!.l1[index].id);
                             dtxtname=TextEditingController(text: homeprovider!.l1[index].name);
                             dtxtstd=TextEditingController(text: homeprovider!.l1[index].std);
                             showDialog(context: context, builder: (context) =>
                               AlertDialog(
                                 content: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                     TextField(
                                       controller: dtxtid,
                                       decoration: InputDecoration(
                                           enabledBorder: OutlineInputBorder(),
                                           focusedBorder: OutlineInputBorder(),

                                       ),
                                     ),
                                     SizedBox(height: 5,),
                                     TextField(
                                       controller: dtxtname,
                                       decoration: InputDecoration(
                                           enabledBorder: OutlineInputBorder(),
                                           focusedBorder: OutlineInputBorder(),

                                       ),
                                     ),
                                     SizedBox(height: 5,),
                                     TextField(
                                       controller: dtxtstd,
                                       decoration: InputDecoration(
                                           enabledBorder: OutlineInputBorder(),
                                           focusedBorder: OutlineInputBorder(),
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                     ElevatedButton(onPressed: (){
                                       stdmodel s1=stdmodel(
                                         std: dtxtstd.text,
                                         id: dtxtid.text,
                                         name: dtxtname.text,
                                       );
                                       homeprovider!.update(index, s1);
                                       Navigator.pop(context);
                                     }, child: Text("Upadte"),),
                                   ],
                                 ),
                               ),);
                           }, icon: Icon(Icons.edit),),
                          ],
                        ),
                      ),
                    ),
                  );
                },itemCount: homeprovider!.l1.length,),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
