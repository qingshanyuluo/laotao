import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';//toast
import 'package:image_picker/image_picker.dart';
import 'package:lao_tao/main.dart';//从相册里面选择图片或者拍照获取照片

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
  int userId;
  String _name;
  String _cost;
  String _location;
  String _commit;
  String _type;
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _costController = new TextEditingController();
  TextEditingController _locationController = new TextEditingController();
  TextEditingController _commitController = new TextEditingController();
  TextEditingController _typeController = new TextEditingController();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery,  maxHeight: 480, maxWidth: 640);
    setState(() {
      _images.add(image);
    });
    // _upLoadImage(_image);//上传图片
  }

  @override
  Widget build(BuildContext context) {
    getShareDate('userid').then((val){
      setState(() {
        userId = val;
      });
    });
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            _images.length == 0
            ? Center(child: Text("请点击右下角以添加图片"),heightFactor: 7,)
            : Container(
              height: 150,
              child: Swiper(
                itemBuilder: (BuildContext context, int index){
                  return Image.file(_images[index]);
                },
                itemCount: _images.length,
                pagination: SwiperPagination(),
                autoplay: true,
              ),
            ),
            Container(
              child: _input(Icon(CupertinoIcons.add), "好店名称", _nameController, false),
            ),
            Container(
              child: _input(Icon(CupertinoIcons.add), "人均消费", _costController, false),
            ),
            Container(
              child: _input(Icon(CupertinoIcons.add), "好店位置", _locationController, false),
            ),
            Container(child: TextField(
              maxLines: 4,
              controller: _commitController,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  hintText: "请输入你的评价",
                  enabledBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 3,
                    ),
                  ),
              ),
            )),
            FlatButton(
              onPressed: (){
                try {
                  int a = int.parse(_costController.text) ;
                } catch (e) {
                  print(e);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(title: Text('消费请填数字'),)
                  );
                  return;
                }
                if (_images.length == 0|| _commitController.text == ""
                || _nameController.text == ""
                || _costController.text == ""
                || _locationController.text == "") {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(title: Text('信息没填完整'),)
                  );
                  return;
                }
                _upLoadImage(_images, _nameController.text,
                 int.parse(_costController.text),
                 _locationController.text, 
                 _commitController.text,
                 _typeController.text);
              }, 
              child: Text("submit", 
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              color: Colors.orange,
            )
          ],
        ),       
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
//上传图片
  _upLoadImage(List<File> image, String name, int cost, String location, String commit, String type) async {
    String path = image[0].path;
    print(path);
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var query = {'shopName': name, 'cost': cost, 'location': location, 'commit': commit, 'shopType': type};
    FormData formData = FormData.from({   
      "file": image.map((img){
        return UploadFileInfo(File(img.path), "kdf");
      }).toList()});
    // });

    Dio dio = new Dio();
    var respone;
    try {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('正在上传，请稍等'),)
      );
      respone = await dio.post<String>("http://lennon.xyz/uploadShop/"+ userId.toString(), data: formData, queryParameters: query);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('上传失败，eee，尴尬'),)
      );
      return;
    }
    // print(respone);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context){
        return Scaffold(
          body: Center(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("提交完毕等待审核哦！", style: TextStyle(color: Colors.blueGrey, fontSize: 30),),
                  BackButton(
                    
                  )
                ],
              ),)
          ),
        );
      }
    ));
    if (respone.statusCode == 200) {
      // Fluttertoast.showToast(
      //     msg: "提交成功，等待审核",
      //     gravity: ToastGravity.CENTER,
      //     textColor: Colors.grey,
      //     timeInSecForIos: 3);
      setState(() {
        _nameController.clear();
        _commitController.clear();
        _costController.clear();
        _typeController.clear();
        _locationController.clear();
        _images.clear();
      });
    }
  }

  Widget _input(
        Icon icon, String hint, TextEditingController controller, bool obsecure) {
      return Container(
        // padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(
            fontSize: 20,
          ),
          decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 0,
                ),
              ),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 3,
                ),
              ),
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(color: Colors.black),
                  child: icon,
                ),
                padding: EdgeInsets.only(left: 30, right: 10),
              )),
        ),
      );
    }
}