# Banner Image

A Flutter Banner widget.

Website example >> https://bannerimage.mustafaturkmen.dev/

## Usage

As simple as using any flutter Widget.

**Example:**
Add the module to your project ``pubspec.yaml``:
```yaml
...
dependencies:
 ...
 banner_image: ^1.0.8
...
```
And install it using ``flutter packages get`` on your project folder. After that, just import the module and use it:

```dart
import 'package:banner_image/banner_image.dart';
//...

BannerImage(
  itemLength: list.length,
  imageUrlList: list,
  selectedIndicatorColor: Colors.red,
  onTap: (){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('On Tap')));
  },
),
```

![horizontal](https://user-images.githubusercontent.com/49743631/164677743-b4559be7-08af-4fa4-95bc-de8405bd161f.gif)

