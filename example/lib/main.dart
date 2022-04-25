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
  'https://via.placeholder.com/2400x900?text=2400x900 index: 0',
  'https://via.placeholder.com/2400x900/344c98?text=2400x900 index: 1',
  'https://via.placeholder.com/2400x900/ffc72c?text=2400x900 index: 2',
  'https://via.placeholder.com/2400x900/B71C1C?text=2400x900 index: 3',
  'https://via.placeholder.com/2400x900/ccdafb?text=2400x900 index: 4',
  'https://via.placeholder.com/2400x900/464250?text=2400x900 index: 5',
  'https://via.placeholder.com/2400x900/27356F?text=2400x900 index: 6'
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const BannerScreen()));
                },
                child: const Text('Banner Screen')),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HorizontalBannerScreen()));
                },
                child: const Text('Horizontal Banner Screen')),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SliderScreen()));
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
              padding: const EdgeInsets.only(),
              itemLength: list.length,
              imageUrlList: list,
              selectedIndicatorColor: Colors.red,
              autoPlay: true,
              onTap: (int index) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('On Tap' + index.toString()),
                ));
              },
            ),
            const SizedBox(height: 50),
            BannerImage(
              itemLength: list.length,
              imageUrlList: list,
              selectedIndicatorColor: Colors.red,
              autoPlay: true,
              borderRadius: BorderRadius.circular(8),
              onTap: (int index) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('On Tap' + index.toString()),
                ));
              },
            ),
            const SizedBox(height: 50),
            BannerImage(
              itemLength: list.length,
              imageUrlList: list,
              borderRadius: BorderRadius.circular(8),
              selectedIndicatorColor: Colors.red,
              onTap: (int index) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('On Tap' + index.toString()),
                ));
              },
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
              borderRadius: BorderRadius.circular(8),
              selectedIndicatorColor: Colors.blue,
              indicatorColor: Colors.green.shade100,
              scrollDirection: Axis.vertical,
            ),
            const SizedBox(height: 15),
            BannerImage(
              aspectRatio: 2,
              itemLength: list.length,
              borderRadius: BorderRadius.circular(8),
              imageUrlList: list,
              selectedIndicatorColor: Colors.red,
              withOutIndicator: true,
              scrollDirection: Axis.vertical,
            ),
            const SizedBox(height: 15),
            BannerImage(
              aspectRatio: 20 / 10,
              itemLength: list.length,
              borderRadius: BorderRadius.circular(8),
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
              aspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height),
              padding: const EdgeInsets.only(),
              itemLength: list.length,
              imageUrlList: list,
              selectedIndicatorColor: Colors.red,
              autoPlay: false,
              withOutIndicator: true,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    );
  }
}
