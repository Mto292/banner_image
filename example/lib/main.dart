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
  'assets/0.png',
  'assets/1.png',
  'assets/2.png',
  'assets/3.png',
  'assets/4.png',
  'assets/5.png',
  'assets/6.png'
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
              children: List.generate(list.length, (index) => Image.asset(
                list[index],
                fit: BoxFit.cover,
              ),),
              onTap: (int index) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('On Tap' + index.toString()),
                ));
              },
            ),
            const SizedBox(height: 50),
            BannerImage(
              itemLength: list.length,
              children: List.generate(list.length, (index) => Image.asset(
                list[index],
                fit: BoxFit.cover,
              ),),
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
              children: List.generate(list.length, (index) => Image.asset(
                list[index],
                fit: BoxFit.cover,
              ),),
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
              children: List.generate(list.length, (index) => Image.asset(
                list[index],
                fit: BoxFit.cover,
              ),),
              selectedIndicatorColor: Colors.red,
              autoPlay: true,
              scrollDirection: Axis.vertical,
            ),
            const SizedBox(height: 15),
            BannerImage(
              itemLength: list.length,
              children: List.generate(list.length, (index) => Image.asset(
                list[index],
                fit: BoxFit.cover,
              ),),
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
              children: List.generate(list.length, (index) => Image.asset(
                list[index],
                fit: BoxFit.cover,
              ),),
              selectedIndicatorColor: Colors.red,
              withOutIndicator: true,
              scrollDirection: Axis.vertical,
            ),
            const SizedBox(height: 15),
            BannerImage(
              aspectRatio: 20 / 10,
              itemLength: list.length,
              borderRadius: BorderRadius.circular(8),
              children: List.generate(list.length, (index) => Image.asset(
                list[index],
                fit: BoxFit.cover,
              ),),
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
              children: List.generate(list.length, (index) => Image.asset(
                list[index],
                fit: BoxFit.cover,
              ),),
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
