<p align="center">
  <img src="https://user-images.githubusercontent.com/798235/51530434-36096580-1e3b-11e9-935e-8d5114c344ed.png" alt="Perspective" />
</p>

<p align="center">
  <a href="http://cocoadocs.org/docsets/Perspective/"><img alt="Supported Platforms" src="https://cocoapod-badges.herokuapp.com/p/Perspective/badge.svg"/></a>
  <a href="http://cocoadocs.org/docsets/Perspective/"><img alt="Version" src="https://cocoapod-badges.herokuapp.com/v/Perspective/badge.svg"/></a>
  <a href="https://github.com/Carthage/Carthage"><img alt="Carthage compatible" src="https://img.shields.io/badge/Carthage-%E2%9C%93-brightgreen.svg?style=flat"/></a>
  <a href="https://travis-ci.org/yannickl/Perspective"><img alt="Build status" src="https://travis-ci.org/yannickl/Perspective.svg?branch=master"/></a>
</p>

***Perspective*** is a powerful and lightweight library to create scrolling and motion parallax.

<p align="center">
  <img src="https://user-images.githubusercontent.com/798235/51496460-24cf4300-1dc0-11e9-9d6c-97d753498f5b.gif" alt="Scrolling and motion parallax" />
</p>

*(Credits: the assets used in the example project come from [Free Game Assets](https://free-game-assets.itch.io/free-parallax-2d-backgrounds))*

<p align="center">
  <a href="#requirements">Requirements</a> • <a href="#usage">Usage</a> • <a href="#installation">Installation</a> • <a href="#contribution">Contribution</a> • <a href="#contact">Contact</a> • <a href="#license-mit">License</a>
</p>

## Requirements

- iOS 11.0+
- Xcode 10.0+
- Swift 4.2+

## Usage

### Basics

Create a `PerspectiveView`:

```swift
import Perspective

let perspectiveView = PerspectiveView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

view.addSubview(perspectiveView)
```

Configure its `contentSize`:

```swift
perspectiveView.contentSize = CGSize(width: 1599, height: 900)
```

Add the images as arranged subviews:

```swift
for i in stride(from: 7, to: 0, by: -1) {
  let imgView = UIImageView(image: UIImage(named: "castle-layer0\(i)"))
  imgView.frame.size = CGSize(width: 1599, height: 900)

  perspectiveView.addArrangedSubview(imgView)
}
```

### Behaviours

A behaviour is an object that allows you to interact with the perspective view. If you want to let your users to scroll the persective you can add a `PerspectiveScrollBehaviour`, and if you want to use the accelerometer just add a `PerspectiveMotionBehaviour`. To add a new behaviour to your perspective view you must call the `addBehaviour` method.

#### Scroll

```swift
perspectiveView.addBehaviour(PerspectiveScrollBehaviour())
```

#### Motion

```swift
perspectiveView.addBehaviour(PerspectiveMotionBehaviour())
```

### How it works

![Layers](https://user-images.githubusercontent.com/798235/51544126-7a0e6180-1e5f-11e9-8071-a53271c99431.png)

1. the `PerspectiveView`'s `frame` rectangle: describes the view’s location and size in its superview’s coordinate system like any another `UIView`.
2. the `PerspectiveView`'s `contentSize`: defines the extent of the content (usually `UIImageView`).
3. the `arrangedSubviews`: list the views arranged by the perspective view. The order of the views work like in any `UIView`. The foreground view is at the end of the array (as opposite to the background which is the first element of the array).

### Configuration

If you use the motion behaviour, configure the `UIRequiredDeviceCapabilities` key of its *Info.plist* file with the `accelerometer` and `gyroscope` values:

![Required device capabilities](https://user-images.githubusercontent.com/798235/51685656-0ef39500-1fef-11e9-85e6-3354a786feec.png)

To go further, take a look at the example project.

## Installation

The recommended approach to use *Perspective* in your project is using the [CocoaPods](http://cocoapods.org/) package manager, as it provides flexible dependency management and dead simple installation.

#### CocoaPods

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```
Go to the directory of your Xcode project, and Create and Edit your *Podfile* and add _Perspective_:

``` bash
$ cd /path/to/MyProject
$ touch Podfile
$ edit Podfile
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'

use_frameworks!
pod 'Perspective', '~> 0.9.0'
```

Install into your project:

``` bash
$ pod install
```

Open your project in Xcode from the .xcworkspace file (not the usual project file):

``` bash
$ open MyProject.xcworkspace
```

You can now `import Perspective` framework into your files.

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate `Perspective` into your Xcode project using Carthage, specify it in your `Cartfile` file:

```ogdl
github "yannickl/Perspective" >= 0.9.0
```

#### Manually

[Download](https://github.com/yannickl/Perspective/archive/master.zip) the project and copy the `Perspective` folder into your project to use it in.

## Contribution

Contributions are welcomed and encouraged *♡*.

## Contact

Yannick Loriot
 - [https://21.co/yannickl/](https://21.co/yannickl/)
 - [https://twitter.com/yannickloriot](https://twitter.com/yannickloriot)

## License (MIT)

Copyright (c) 2018-present - Yannick Loriot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
