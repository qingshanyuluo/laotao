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
        body: Center(child: Container(
          child: HeadImageUploadPage(),
          )
        ) 
      ),
    );
  }
}



class HeadImageUploadPage extends StatefulWidget {
  @override
  _HeadImageUploadPageState createState() => _HeadImageUploadPageState();
}

class _HeadImageUploadPageState extends State<HeadImageUploadPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _upLoadImage(image);//上传图片
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
//上传图片
  _upLoadImage(File image) async {
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    FormData formData = new FormData.from({
      "file": new UploadFileInfo(new File(path), name)
    });
    Dio dio = new Dio();
    var respone = await dio.post<String>("路径", data: formData);
    if (respone.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "图片上传成功",
          gravity: ToastGravity.CENTER,
          textColor: Colors.grey);
    }
  }
}










// class WeiboPage extends StatefulWidget {
//   WeiboPage({Key key}) : super(key: key);

//   _WeiboPageState createState() => _WeiboPageState();
// }

// class _WeiboPageState extends State<WeiboPage> {
//   TextEditingController typeController = TextEditingController();
//   String buttonText = "hhhhhhhhhh";
//   String showText = "hhhhhhhhhh";
  
//   @override
//     Widget build(BuildContext context) {
//     return Container(
//        child:  Scaffold(
//         appBar: AppBar(title: Text('获取微波数据'),),
//         body: Container(
//           child: Column(
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: _choiceAction,
//                 child: Text('发送'),
//               ),
//               Text(
//                 showText,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 3,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _choiceAction(){
//     print("jjjjjjjjjjjjjjjjjjjjjj");

//       getHttp(typeController.text.toString()).then((val){
//         setState(() {
//           print(val);
//           showText = val.toString();
//         });
//       });
//   }

//   Future getHttp(String typedText) async{
//     try {
//       Response response;
//       Options options = Options(headers: httpHeader);
//       response = await Dio().post("https://m.weibo.cn/api/container/getIndex?type=uid&value=2803301701&containerid=1005052803301701",options: options);
//       print(response);
//       return response.data;
//     } catch (e) {
//       print(e);
//     } 
//   }
// }