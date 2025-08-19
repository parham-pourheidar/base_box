📦 BaseBox

A highly customizable Flutter widget that combines Container + InkWell + Tooltip into a single reusable component.

It gives you full control over styling, interactions, and layout, so you don’t have to write repetitive boilerplate code.

✨ Features

✅ Tap handling with onTap

✅ Hover detection with onHover

✅ Tooltip support

✅ Customizable padding & margin (all, horizontal/vertical, or per-side)

✅ Borders (uniform or per-side) with radius control

✅ Box shadows & gradients

✅ Splash & hover colors

✅ Circle or rectangle shapes

✅ Clip behavior support

✅ Center child by default (optional)

🚀 Installation

Add this to your pubspec.yaml:

dependencies:
base_box: ^1.0.0


Then import it:

import 'package:base_box/base_box.dart';

📖 Usage
Basic Example
BaseBox(
height: 100,
width: 100,
color: Colors.blue,
borderRadius: 12,
onTap: () => print('Tapped!'),
tooltip: 'Tap me',
child: Icon(Icons.touch_app, color: Colors.white),
)

With Gradient & Shadow
BaseBox(
height: 120,
width: 120,
gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurpleAccent]),
boxShadow: [
BoxShadow(
color: Colors.black26,
blurRadius: 8,
offset: Offset(2, 4),
),
],
onTap: () => print("Gradient box tapped"),
child: Text("Hello", style: TextStyle(color: Colors.white)),
)

Circle Shape
BaseBox(
height: 80,
width: 80,
isCircle: true,
color: Colors.orange,
child: Icon(Icons.star, color: Colors.white),
)

Custom Borders
BaseBox(
height: 100,
width: 200,
leftBorder: BorderSide(color: Colors.red, width: 3),
topBorder: BorderSide(color: Colors.green, width: 2),
child: Text("Custom borders"),
)

⚙️ Parameters
Name	Type	Default	Description
onTap	Function()?	null	Called when tapped
onHover	Function(bool)?	null	Called on hover changes
tooltip	String?	null	Tooltip message
height, width	double?	null	Size control
color	Color?	null	Background color
gradient	Gradient?	null	Background gradient
boxShadow	List<BoxShadow>?	null	Box shadows
borderColor	Color?	null	Border color
borderWidth	double?	1	Border width
radius	double	8	Border radius
isCircle	bool	false	Circle shape
padding*	double?	null	Full / symmetric / per-side padding
margin*	double?	null	Full / symmetric / per-side margin
clipBehavior	Clip	antiAlias	Clipping for child content
💡 Why use BaseBox?

Instead of combining Container, InkWell, Tooltip, Padding, and custom borders over and over again,
you can just use BaseBox and configure everything in one place.