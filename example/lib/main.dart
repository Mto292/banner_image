import 'package:banner_image/banner_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Banner'),
    );
  }
}

final list = [
  'https://instagram.fist2-3.fna.fbcdn.net/v/t51.2885-15/67827892_2639409202736800_2790074853079473057_n.jpg?stp=dst-jpg_e35&_nc_ht=instagram.fist2-3.fna.fbcdn.net&_nc_cat=104&_nc_ohc=Vf8FRHBPE0QAX9s6RKS&edm=ALQROFkBAAAA&ccb=7-4&ig_cache_key=MjExMTU3MjI3NTkwNzEwNTQzNw%3D%3D.2-ccb7-4&oh=00_AT8DTcYHoC8cYVU6vhxk3ADN5eThCmwu9bPsZ5wzeRNn7Q&oe=625EDE4E&_nc_sid=30a2ef',
  'https://instagram.fist2-3.fna.fbcdn.net/v/t51.2885-15/43167226_367971963778928_9068129640067978644_n.jpg?stp=dst-jpg_e35_s750x750_sh0.08&_nc_ht=instagram.fist2-3.fna.fbcdn.net&_nc_cat=108&_nc_ohc=Gzmbdk0J4OAAX_jSe6t&edm=AABBvjUBAAAA&ccb=7-4&ig_cache_key=MTg4OTEyNzkxNDI1NzQ5ODkxMQ%3D%3D.2-ccb7-4&oh=00_AT87V7vjBHtnWDwh7p3qkXLwiZxutnCzhBjoyQiKLsekWw&oe=625F31EC&_nc_sid=83d603',
  'https://instagram.fist2-4.fna.fbcdn.net/v/t51.2885-15/12976210_212799839103766_607584564_n.jpg?stp=dst-jpg_e35_s750x750_sh0.08&_nc_ht=instagram.fist2-4.fna.fbcdn.net&_nc_cat=110&_nc_ohc=pErUGP5vWs4AX-Vwjcw&edm=ALQROFkBAAAA&ccb=7-4&ig_cache_key=MTIzODM4NTM3NzE1ODYwNzk4Ng%3D%3D.2-ccb7-4&oh=00_AT_QxAkiFoWnoIuSlZW6jBlP73iTgA2_QLSYdOK3SezIdA&oe=626021A1&_nc_sid=30a2ef',
  'https://instagram.fist2-4.fna.fbcdn.net/v/t51.2885-15/12783346_1573939086229774_53943446_n.jpg?stp=dst-jpg_e35_s750x750_sh0.08&_nc_ht=instagram.fist2-4.fna.fbcdn.net&_nc_cat=110&_nc_ohc=ldWCTcaHQO4AX-9fgbr&edm=ALQROFkBAAAA&ccb=7-4&ig_cache_key=MTIwNTgxNzY1OTMwMTgwMzU1NA%3D%3D.2-ccb7-4&oh=00_AT9M0Rqpvg-ArlScOwN6vWsCsEBSHBYKlnzwfxnfmhaX_Q&oe=62601ACF&_nc_sid=30a2ef',
  'https://instagram.fist2-3.fna.fbcdn.net/v/t51.2885-15/12816788_224420084574489_1421631600_n.jpg?stp=dst-jpg_e35_s750x750_sh0.08&_nc_ht=instagram.fist2-3.fna.fbcdn.net&_nc_cat=109&_nc_ohc=GNVvzz0IyiEAX94sDBS&tn=3fr9Db0A5edmBH5r&edm=ALQROFkBAAAA&ccb=7-4&ig_cache_key=MTE5ODY0NTQzMTE3OTEzMDU2Mg%3D%3D.2-ccb7-4&oh=00_AT_lTrjCB0YiHsegMardsrHkzMVwgsFAzpbISV-Oi26PJQ&oe=625FE53D&_nc_sid=30a2ef',
  'https://instagram.fist2-3.fna.fbcdn.net/v/t51.2885-15/12747747_181051125602289_2108752994_n.jpg?stp=dst-jpg_e35_s750x750_sh0.08&_nc_ht=instagram.fist2-3.fna.fbcdn.net&_nc_cat=109&_nc_ohc=Ejg8tJpgpFkAX8ELd0M&edm=ALQROFkBAAAA&ccb=7-4&ig_cache_key=MTE4Nzg0NDM0NjM0MDQyMjk1Nw%3D%3D.2-ccb7-4&oh=00_AT8374GiNo_XgNraTh5RnbMKECBgEEaYzYHVJRtgp1CLkQ&oe=625F6B7C&_nc_sid=30a2ef',
  'https://instagram.fist2-4.fna.fbcdn.net/v/t51.2885-15/14359339_1703997819864593_849004968_n.jpg?stp=dst-jpg_e35_s750x750_sh0.08&_nc_ht=instagram.fist2-4.fna.fbcdn.net&_nc_cat=105&_nc_ohc=VUCgrm-VJ3oAX85pZZs&edm=ALQROFkBAAAA&ccb=7-4&ig_cache_key=MTM0MDUyNTIwNTU1NDE0MDI3Nw%3D%3D.2-ccb7-4&oh=00_AT-WhpMacOjbn0otIB8G87aJbpkc62oRdhsCuQ7zO8r8jQ&oe=626076CA&_nc_sid=30a2ef'
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const BannerScreen()));
                },
                child: const Text('Banner Screen')),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const HorizontalBannerScreen()));
                },
                child: const Text('Horizontal Banner Screen')),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SliderScreen()));
              },
              child: const Text("Slider Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerScreen extends StatefulWidget {
  const BannerScreen({Key? key}) : super(key: key);

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerImage(
              cardDecoration: const BoxDecoration(),
              padding: const EdgeInsets.only(),
              itemLength: list.length,
              imageUrlList: list,
              selectedIndicatorColor: Colors.red,
              autoPlay: true,
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalBannerScreen extends StatefulWidget {
  const HorizontalBannerScreen({Key? key}) : super(key: key);

  @override
  State<HorizontalBannerScreen> createState() => _HorizontalBannerScreenState();
}

class _HorizontalBannerScreenState extends State<HorizontalBannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Banner'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerImage(
              cardDecoration: const BoxDecoration(),
              padding: const EdgeInsets.only(),
              itemLength: list.length,
              imageUrlList: list,
              selectedIndicatorColor: Colors.red,
              autoPlay: true,
              scrollDirection: Axis.vertical,
            ),
            const SizedBox(height: 15),
            BannerImage(
              itemLength: list.length,
              imageUrlList: list,
              selectedIndicatorColor: Colors.blue,
              indicatorColor: Colors.green.shade100,
              scrollDirection: Axis.vertical,
            ),
            const SizedBox(height: 15),
            BannerImage(
              aspectRatio: 2,
              itemLength: list.length,
              imageUrlList: list,
              selectedIndicatorColor: Colors.red,
              withOutIndicator: true,
              scrollDirection: Axis.vertical,
            ),
            const SizedBox(height: 15),
            BannerImage(
              aspectRatio: 20 / 10,
              itemLength: list.length,
              imageUrlList: list,
              selectedIndicatorColor: Colors.red,
              scrollDirection: Axis.vertical,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerImage(
              aspectRatio: MediaQuery.of(context).size.width/ (MediaQuery.of(context).size.height),
              cardDecoration: const BoxDecoration(),
              padding: const EdgeInsets.only(),
              itemLength: list.length,
              imageUrlList: list,
              selectedIndicatorColor: Colors.red,
              autoPlay: false,
              withOutIndicator: true,
            ),
          ],
        ),
      ),
    );
  }
}
