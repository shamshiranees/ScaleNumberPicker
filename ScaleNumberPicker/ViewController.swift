//
//  ViewController.swift
//  CustomUIPickerCell
//
//  Created by Frederik Jacques on 05/07/15.
//  Copyright (c) 2015 Frederik Jacques. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBOutlet weak var selectedHeightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        pickerView.subviews.forEach({
            
            $0.isHidden = $0.frame.height < 1.0
        })
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.width
    }
    
    // MARK: - Delegate methods
    // MARK: UIPickerViewDelegate methods
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedHeightLabel.text = "Your height is \(row+150)cm"
//        print("Selected height \(row+150)")
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let rowData = row+150
        return self.createScaleView(rowHeight: 80,widthOfScaleView: 80, title: "\(rowData)cm", pickerView: pickerView)
     
    }
    
    
    func createScaleView(rowHeight height:Double,widthOfScaleView width:Double? = 45,numberOfSeperation:Int? = 5,title:String,bgColor:UIColor? = UIColor.clear,lineColor:UIColor? = UIColor.white,titleColor:UIColor? = UIColor.white,pickerView:UIPickerView,fontSize:CGFloat?=20)->UIView{
        if (numberOfSeperation!<5 || numberOfSeperation!%2 == 0 ){
            let nilView = UIView()
            print("Invalid number of seperation.Please enter an odd number > 4")
            return nilView
        }else{
        let numberOfSeperations = numberOfSeperation
            let lineDivide = height/Double(numberOfSeperations!)
        let view = UIView()
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = titleColor
            titleLabel.font = titleLabel.font.withSize(fontSize!)
        titleLabel.textAlignment = .left
            var rect: CGRect = titleLabel.frame
            rect.size = (titleLabel.text?.size(withAttributes: [NSAttributedStringKey.font: UIFont(name: titleLabel.font.fontName , size: fontSize!)!]))!
        titleLabel.backgroundColor = bgColor
        titleLabel.frame =  CGRect(x: Double(pickerView.frame.size.width/2)-Double(rect.width), y: 0, width: Double(rect.width+3), height: height)
        view.addSubview(titleLabel)
        
        let scaleView = UIView()
            scaleView.frame = CGRect(x: Double(pickerView.frame.size.width/2), y: 0, width: width!, height: height)
        scaleView.backgroundColor = bgColor
        let lineColor = lineColor
            for i in 0...numberOfSeperations!-1{
                if i == numberOfSeperations!/2{
                    let middleLineView = UIView(frame: CGRect(x: width!*0.25, y: (height/2)-1, width: width!*0.75, height: 2))
                middleLineView.backgroundColor = lineColor
                scaleView.addSubview(middleLineView)
            }else{
                    let LineView1 = UIView(frame: CGRect(x: width!/2, y: lineDivide*(Double(i)+0.5), width: width!/2, height: 1))
            LineView1.backgroundColor = lineColor
            scaleView.addSubview(LineView1)
            }
        }
        
        view.addSubview(scaleView)
    
        return view
        }
    }
    
    
}


