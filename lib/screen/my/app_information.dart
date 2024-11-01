import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laxy/common/const/oss_licenses.dart';

class OssLicensesPage extends StatelessWidget {
  static Future<List<String>> loadLicenses() async {
    final ossKeys = List<String>.from(dependencies);
    return ossKeys..sort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child:  Text(
              "오픈소스 라이선스",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text("이미지 출처"),
                // subtitle: ossLicenses[i].description != null ? Text(ossLicenses[i].description!) : null,
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    ImageLicenseScreen()
                  )
                );
                },
                // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MiscOssLicenseSingle(name: ossLicenses[i].name, json: ossLicenses[i])))
              ),
              for (var i = 0; i < dependencies.length; i++)
                ListTile(
                  title: Text(dependencies[i].name),
                  // subtitle: ossLicenses[i].description != null ? Text(ossLicenses[i].description!) : null,
                  trailing: Icon(Icons.chevron_right),
                  onTap: (){
                    // 클릭하면 해당 오픈소스 라이선스 페이지로 이동
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        AppInformation(
                            name: dependencies[i].name ?? '',
                            version: dependencies[i].version ?? '',
                            description: dependencies[i].description ?? '',
                            licenseText: dependencies[i].license ?? '',
                            homepage: dependencies[i].homepage ?? ''
                        )
                    )
                    );

                  },
                  // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MiscOssLicenseSingle(name: ossLicenses[i].name, json: ossLicenses[i])))
                )
            ],
          ),
        )
    );
  }
}

class ImageLicenseScreen extends StatelessWidget {
  ImageLicenseScreen({super.key});

  List<Package> image = [
    Package(name: 'Metallic Holographic Iridescent Gradient Wallpaper 5', description: "https://www.freepik.com/free-photo/metallic-holographic-iridescent-gradient-wallpaper-5_39994292.htm#fromView=search&page=4&position=3&uuid=552f7f61-c270-461f-80a3-659c14111614", authors: [], version: '', isMarkdown: false, isSdk: false, dependencies: []),
    Package(name: 'beautiful-glowing-gray-full-moon', description: "https://www.freepik.com/free-photo/beautiful-glowing-gray-full-moon_29302752.htm#fromView=search&page=1&position=0&uuid=0a9ebd30-c831-4d5c-bad7-ffe0f31d99cd", authors: [], version: '', isMarkdown: false, isSdk: false, dependencies: []),
    Package(name: 'globe-1348777', description: "https://pixabay.com/ko/users/maiconfz-1424200/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=1348777", authors: [], version: '', isMarkdown: false, isSdk: false, dependencies: []),
    Package(name: '3d-rendering-planet-earth', description: "https://www.freepik.com/free-photo/3d-rendering-planet-earth_44957937.htm#fromView=search&page=3&position=18&uuid=135b0cd6-4cbb-4037-8c76-120b7b9c3852", authors: [], version: '', isMarkdown: false, isSdk: false, dependencies: []),
    Package(name: 'nebula-668783', description: "https://pixabay.com/ko/users/milliemopsstock-688242/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=668783", authors: [], version: '', isMarkdown: false, isSdk: false, dependencies: []),
    Package(name: 'sky-319546', description: "https://pixabay.com/ko/illustrations/%ED%95%98%EB%8A%98-%ED%8C%8C%EB%9E%80%EC%83%89-%EC%9D%BC-%EC%97%AC%EB%A6%84-319546/", authors: [], version: '', isMarkdown: false, isSdk: false, dependencies: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child:  Text(
              "이미지 라이선스",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < image.length; i++)
                ListTile(
                  title: Text(image[i].name),
                  // subtitle: ossLicenses[i].description != null ? Text(ossLicenses[i].description!) : null,
                  trailing: Icon(Icons.chevron_right),
                  // subtitle: Text(image[i].description, ),
                  onTap: () {
                    final String textToCopy = image[i].description;
                    Clipboard.setData(ClipboardData(text: textToCopy)).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('클립보드에 링크가 복사되었습니다: $textToCopy')),
                      );
                    });
                  }
                )
            ],
          ),
        )
    );
  }
}


class AppInformation extends StatelessWidget {
  final String name;
  final String version;
  final String description;
  final String licenseText;
  final String homepage;


  AppInformation({
    required this.name,
    required this.version,
    required this.description,
    required this.licenseText,
    required this.homepage,
  });

  String _bodyText() {
    return licenseText.split('\n').map((line) {
      if (line.startsWith('//')) line = line.substring(2);
      line = line.trim();
      return line;
    }).join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child:  Text(
            "오픈소스 라이선스",
            style: TextStyle(
              fontSize: 16
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(name),
              subtitle: Text('version : $version'),
            ),
            if (description != null)
              Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                  child: Text(description)),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Text(
                  _bodyText(),
              ),
            ),
            const Divider(),
            // ListTile(
            //     title: Text('Homepage'),
            //     subtitle: Text(homepage),
            //     onTap: () async {
            //       if (await canLaunch(homepage)) {
            //         await launch(homepage);
            //       } else {
            //         throw 'Could not launch $homepage';
            //       }
            //     }
            // ),
          ],
        ),
      ),
    );
  }
}