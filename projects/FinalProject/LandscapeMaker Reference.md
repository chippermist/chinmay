# LandscapeMaker Library Reference

## Goal

The goal of this library is to provide a simple, easy and quick way to draw simple elements of a standard lanscape painting for Processing 3.x. This library was compiled compataible with JRE 1.8. This covers standard elements such as weather, and some objects that can be drawn on the screen. 

## Structure

There are multiple elements of landscape drawings that this library supports. Currently the structure of the library looks as follows. 

- LandscapeMaker Main
- Mountains
- Sun
- Trees
- Weather

### Instantiation

To create an instant of an object for any of the classes mentioned above you can declare an object of the type and initialize as example below.

```
Trees t;                //creating an object of the class
t = new Trees(this);    // passing in the current applet
```

Within these different classes there are multiple public member functions that the user is allowed to access to create objects. The currently available public functions seperated in classes are:

### LandscapeMaker

This is the superclass. This should only be used to get metadata. 

### Mountains

This object type allows you to create mountains within your processing drawing.

`void mountains(int numberOfRanges)`

where `numberOfRanges` is the amount of mountain ranges you want stacked on top of each other. 

`void mountains(int H, int S, int B, int interval)`

where `int H, int S, int B` are values of the [Hue, Saturation and Brightness] of the mountains respectively and `int interval` is the distance you want between the different ranges of mountains. Currently this makes about 10 mountain ranges whenever invoked. This can be changed within the souce code and recompiled.

### Sun

This object type allows you to create circular planetary like objects within the processing drawing. 

`void sun(String type, int xCoordinate, int yCoordinate, float radius)`

where the type can be `CLASSIC` - for a simple circular object or `SPOKES` for a circular object with spokes. `xCoordinate, yCoordinate and radius` are for determining where the object will be drawn. By default an illegal value for type will draw a `SPOKES` type sun. 

### Trees

This object type allows you to create tree/grass like objects within your processing drawing.

`void grass(int height, float RValue, float BValue, float GValue, int limit)` 

where height is the maximum height of grass, `RBG` values are color of grass and limit is the amount of grass that needs to be drawn. 

`void grass(int height, int limit)` 

where height is the maximum height of grass, and limit is the amount of grass that needs to be drawn. Default RBG values are (R - [0,100], B - [100, 255], G - [0, 100]).

`void grass(int height)` - where height is the maximum height of grass. Default number of grass here is 200. The default RBG values are same as above.

`void tree(float xCoordinate, float yCoordinate, float depthValue, float angle, float heightVal)`

where depthValue is how many depth iterations you want the tree branches to have. Angle signifies the starting angle of branches and leaves. heightVal is the maximum value of the height of tree that you want. 

`void leaf(float xCoordinate, float yCoordinate, float leafAngle)`

where leafAngle is the angle at which the leaf is to be drawn.

### Weather

This object type allows you to create weather objects and simulate weather within the processing drawing. This type of object should be preferrably called within `draw()` to siumulate a active weather.

`void snowflake()` 

this creates a simple snowflake on the screen. This can be used to make a snowfall within processing drawing.

`void snow(int quantity)`

where quantity is the amount of random snow you want on the screen. This will be randomly placed throughout the width and height of the drawing.


---
## FYIs

Most of the elements within this library are static and can become memory intensive when drawn, so should be called outside of `draw()`.

Some objects being drawn are examples found online, and such code has been cited within the source.
