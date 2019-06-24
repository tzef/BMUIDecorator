# BMUIDecorator

[![CI Status](https://img.shields.io/travis/LEE%20ZHE%20YU/BMUIDecorator.svg?style=flat)](https://travis-ci.org/LEE%20ZHE%20YU/BMUIDecorator)
[![Version](https://img.shields.io/cocoapods/v/BMUIDecorator.svg?style=flat)](https://cocoapods.org/pods/BMUIDecorator)
[![License](https://img.shields.io/cocoapods/l/BMUIDecorator.svg?style=flat)](https://cocoapods.org/pods/BMUIDecorator)
[![Platform](https://img.shields.io/cocoapods/p/BMUIDecorator.svg?style=flat)](https://cocoapods.org/pods/BMUIDecorator)

## About
Since the consistency in UI style is overwhelming our work, I need a system to avoid the chaos style.
The idea is by providing several json which define separate categories of styles, and then programers writes out style code in Decorator Code, finally matching them by Tags.

## DEMO
<img src="https://github.com/tzef/BMUIDecorator/blob/master/demo.gif">

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage
#### Strongly suggest to refer the example code, must to prepare decorator code and style file by yourself
#### installing the code to DecoratorStores when application finished launch
````swift
BMUIDecoratorStoresManager.default.autoGenerate(storeName: STORENAME, decoratorCode: DECORATORCODE)
````
#### using func decoratorActive to active styles, recommend doning the way by enum, avoiding some keying mistake 
````swift
func decoratorActive<T>(uiTags: [T])
````


## Requirements
iOS 9.0 +
Swift 5

## Installation

BMUIDecorator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BMUIDecorator'
```

## Author

LEE ZHE YU, tzef8220@gmail.com

## License

BMUIDecorator is available under the MIT license. See the LICENSE file for more info.
