# fm_fit

A flutter plugin for adapting screen and font size.
 Let your UI display a reasonable layout on different screen sizes!

## Usage:

### Add dependency：
Please check the latest version before installation.
```
dependencies:
  fm_fit: ^0.0.1
```

### Add the following imports to your Dart code:
```
import 'package:fm_fit/fm_fit.dart';
```

### Property
   
|Property|Type|Default Value|Description|
|:---|:---|:---|:---| 
|width|int|750px|The width of the device in the design draft, in px|
|scale|double|1.0|scale|

### Function
- double t(double value)
- EdgeInsets fromLTRB(double left, double top, double right, double bottom)
- EdgeInsets all(double value)
- EdgeInsets only({double left = 0.0,double top = 0.0,double right = 0.0,double bottom = 0.0})

### Example
```
import 'package:fm_fit/fm_fit.dart';
final FmFit fit = FmFit(width:750);
```

```
SizedBox(height: fit.t(120.0))
```

```
Container(
    margin: fit.only(top: 40.0),
    padding: fit.fromLTRB(30, 34, 30, 0),
    child: Text("test")
)
```

```
Text(
    "test",
    textAlign: TextAlign.center,
    style: TextStyle(
        color: Colors.white,
        fontSize: fit.t(34),
        letterSpacing: fit.t(4),
        fontWeight: FontWeight.bold,
    ),
),
```