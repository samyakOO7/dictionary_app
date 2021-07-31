

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:unrar_file/unrar_file.dart';

import 'dart:async';
import 'package:path/path.dart' as Path;

import 'package:path_provider/path_provider.dart';


class MainPage extends StatefulWidget{
  @override
  _MainPage createState()=>_MainPage() ;




}

class _MainPage  extends State<MainPage> {
 void initState() {
  super.initState();
  extraction();
 }
 final state = [ "Andhra Pradesh",
  "Arunachal Pradesh",
  "Assam",
  "Bihar",
  "Chhattisgarh",
  "Goa",
  "Gujarat",
  "Haryana",
  "Himachal Pradesh",
  "Jammu and Kashmir",
  "Jharkhand",
  "Karnataka",
  "Kerala",
  "Madhya Pradesh",
  "Maharashtra",
  "Manipur",
  "Meghalaya",
  "Mizoram",
  "Nagaland",
  "Odisha",
  "Punjab",
  "Rajasthan",
  "Sikkim",
  "Tamil Nadu",
  "Telangana",
  "Tripura",
  "Uttarakhand",
  "Uttar Pradesh",
  "West Bengal",
  "Andaman and Nicobar Islands",
  "Chandigarh",
  "Dadra and Nagar Haveli",
  "Daman and Diu",
  "Delhi",
  "Lakshadweep",
  "Puducherry"];


 String rar_path = 'myasset/Animation.rar';
 late String file_path;
 late String destination_path ;
 late Directory tempDir;
late FileSystemEntity a;
 extraction() async {
  await extract_file(rar_path);
 }

 Future<List<String>>get_input_and_destination_path(asset_file_path) async{
  // for this example

  // inside tempDir rar files kept and later
  // extracted outputs are also stored in the same directory.
  if (Platform.isIOS) {
   tempDir = await getApplicationDocumentsDirectory();
  }
  else{
   tempDir = await getTemporaryDirectory();
  }
 // await delete_file();
  //empty the directory removing previous results.
  //await delete_file();
  var input_path = Path.join(tempDir.path, Path.basename(asset_file_path));
  // inside the file_path first copy the file from the assets folder.

  ByteData data = await rootBundle.load(asset_file_path);
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(input_path).writeAsBytes(bytes);
  destination_path = tempDir.path;


  return [input_path, destination_path];
 }

 Future<void> extract_file(file_path, {password=""}) async {

  var input_output = await get_input_and_destination_path(file_path);

  var input_file_path = input_output[0];

  var destination_path = input_output[1];

  // Extraction may fail, so we use a try/catch PlatformException.
  try {
   var result= await UnrarFile.extract_rar(input_file_path,  destination_path);
   print(result);
   List<FileSystemEntity> entries = tempDir.listSync(recursive: false).toList();
   a=entries[0];
   print(a);

  } catch(e) {

   print("extraction failed $e");
  }
 }




  @override
  Widget build(BuildContext context) {
   // TODO: implement build
   var icon;
   return Scaffold(
    appBar: AppBar(
        title: Text("Bangla to English Dictionary"),
        actions: [
        ]
    ),
    body: Container(
        child: buildFloatingSearchBar()
    ),
   );
  }

 Widget buildFloatingSearchBar() {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
  transitionDuration: const Duration(milliseconds: 800),
  transitionCurve: Curves.easeInOut,
  physics: const BouncingScrollPhysics(),
  axisAlignment: isPortrait ? 0.0 : -1.0,
  openAxisAlignment: 0.0,
  width: isPortrait ? 600 : 500,
  debounceDelay: const Duration(milliseconds: 500),
  onQueryChanged: (query) {
   ListView.builder(itemBuilder: (BuildContext context, int index) =>

       ListTile(
        title: RichText(
         text: TextSpan(
             text: state[index].substring(0,query.length),
             style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
             children:
             [
              TextSpan(
               text: state[index].substring(query.length),
               style: TextStyle(color: Colors.grey),
              )
             ]
         ),
        ),
       ),

   );
  },
  // Specify a custom transition to be used for
  // animating between opened and closed stated.
  transition: CircularFloatingSearchBarTransition(),
  actions: [
  FloatingSearchBarAction(
  showIfOpened: false,
  child: CircularButton(
  icon: const Icon(Icons.search),
  onPressed: () {},
  ),
  ),
  FloatingSearchBarAction.searchToClear(
  showIfClosed: false,
  ),
  ],
  builder: (context, transition) {
  return
   SizedBox(height: 101,width: 100,
     child: ListView.builder(itemBuilder: (BuildContext context, int index) =>

        ListTile(
         title: RichText(
          text: TextSpan(
              text: state[index],
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              children:
              [
               TextSpan(
                text: state[index],
                style: TextStyle(color: Colors.grey),
               )
              ]
          ),
         ),
        ),

  ),
   );
  });
  }
}

