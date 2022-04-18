# Banner Image

A Flutter Banner widget.

## Usage

As simple as using any flutter Widget.

**Example:**
Add the module to your project ``pubspec.yaml``:
```yaml
...
dependencies:
 ...
 banner_image: ^1.0.0
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
![vertical](doc/vertical.gif)
