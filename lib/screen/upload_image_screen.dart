import 'dart:convert'; // JSON 파싱을 위해 추가
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? _image;
  String? _uploadedFileUrl; // 업로드된 파일 URL을 저장할 변수

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  String _getContentType(String path) {
    final extension = path.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      default:
        return 'application/octet-stream'; // 기본값
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    final contentType = _getContentType(_image!.path);
    final bytes = await _image!.readAsBytes();

    final response = await http.post(
      Uri.parse('https://api.bytescale.com/v2/accounts/kW15cGZ/uploads/binary'),
      headers: {
        'Authorization': 'Bearer public_kW15cGZ3pbvhDgeuAVKuifkQ2PFB',
        'Content-Type': contentType,
      },
      body: bytes,
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      setState(() {
        _uploadedFileUrl = jsonResponse['fileUrl']; // 파일 URL 저장
      });
    } else {
      setState(() {
        _uploadedFileUrl = null; // 실패 시 URL 초기화
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Upload')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? Text('No image selected.')
                  : Image.file(_image!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text('Upload Image'),
              ),
              SizedBox(height: 20),
              if (_uploadedFileUrl != null)
                Column(
                  children: [
                    Text('Uploaded File URL:'),
                    Image.network(_uploadedFileUrl!), // 업로드된 이미지 표시
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: UploadImageScreen()));
}
