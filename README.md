# ScaleNumberPicker
Custom UIPickerView with scale UI

## ScreenShots

![ScreenShot](https://github.com/shamshiranees/ScaleNumberPicker/blob/master/ScaleNumberPicker/screenShot1.png)

## Example

To run the example project,download the project and run.

## Requirements
Swift 3.0 <br>
Xcode 9.0 <br>

## Usage
```swift
Copy the createScaleView() function and paste it in your swift file

/*Basic Usage
createScaleView is a function which returns a UIView which can be added as picker view.
rowHeight - pass the height of row of pickerview.This should be equal
title - text needed to display
pickerView - pass you pickerview

/*
createScaleView(rowHeight: 80, title: "\(rowData)cm", pickerView: pickerView)


```
### Customize
```swift

createScaleView(rowHeight: rowHeight, widthOfScaleView: rowHeight, numberOfSeperation: 7, title: IndexPath.row, bgColor: .red, lineColor: .white, titleColor: .white, pickerView: pickerView, fontSize: 25)

```



## Author

shamshir.anees@gmail.com

