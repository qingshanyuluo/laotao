import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';//toast
import 'package:image_picker/image_picker.dart';//从相册里面选择图片或者拍照获取照片

class AddPage extends StatelessWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("添加好店"),),
        body: Container(
          child: HeadImageUploadPage(),
          )
        )
      );
  }
}



class HeadImageUploadPage extends StatefulWidget {
  @override
  _HeadImageUploadPageState createState() => _HeadImageUploadPageState();
}

class _HeadImageUploadPageState extends State<HeadImageUploadPage> {
  // File _image;
  List<File> _images = new List();
  int i;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _images.add(image);
    });
    // _upLoadImage(_image);//上传图片
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: _image == null
      //       ? Text('No image selected.')
      //       : Image.file(_image),
      // ),
      body: Center(
        child: _images.length==0
        ? Text("jjj")
        :
        Row(
          children: <Widget>[
            Column(
              children: _images.map((file){
                return Image.file(file, height: 20,);
              }).toList(),
            ),
            RaisedButton(
              onPressed: (){
                _upLoadImage(_images);
              },
            )
          ],
        )
       
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
//上传图片
  _upLoadImage(List<File> image) async {
    String path = image[0].path;
    print(path);
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    // FormData formData = new FormData.from({
    //   "file": new UploadFileInfo(new File(path), name),
    // });
    FormData formData = FormData.from({
      "file": [
        // UploadFileInfo(File("./example/upload.txt"), "upload.txt"),
        UploadFileInfo(File(path), name),
        UploadFileInfo(File(path), name),
        // "jfldfjlsafjol",
        // "jfldfjlsafjol",
        // "jfldfjlsafjol",
      ]      
    });
    Dio dio = new Dio();
    var respone = await dio.post<String>("http://lennon.xyz/uploadShop/1?name=火鸡的夫&cost=34&location=天津&commit=警方答飞沙芬按时发货经费和四放哈师大封杀康复后的萨科&type=烤鸭打撒十大", data: formData);
    // var respone = await dio.post<String>("http://lennon.xyz/uploadShop/1?name=火鸡的夫&cost=34&location=天津&commit=警方答飞沙芬按时发货经费和四放哈师大封杀康复后的萨科&type=烤鸭打撒十大");
    print(respone);
    if (respone.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "图片上传成功",
          gravity: ToastGravity.CENTER,
          textColor: Colors.grey);
    }
  }
}
