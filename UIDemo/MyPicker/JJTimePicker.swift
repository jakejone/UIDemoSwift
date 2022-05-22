//
//  JJTimePicker.swift
//  UIDemo
//
//  Created by jake on 2022/5/18.
//

import UIKit

class JJTimePicker: UIView {
    
    var timePicker : UIPickerView?
    var selectedRow:Int = 0
    
    init() {
        super.init(frame: CGRect())
        timePicker = UIPickerView()
        timePicker?.delegate = self
        timePicker?.dataSource = self
        
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        
        self.addSubview(timePicker!)
        timePicker!.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        let selectedRow = self.getSelectedRow()
        timePicker?.selectRow(selectedRow, inComponent: 0, animated: false)
        timePicker?.layer.borderWidth = 1.0
        timePicker?.layer.borderColor = UIColor.red.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func getSelectedRow() -> Int {
        return 1
    }
    
}

extension JJTimePicker: UIPickerViewDelegate {
    
    @objc func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = view as? UILabel
        if label != nil {
            print("exist label    \(row)")
        } else {
            print("no exist label \(row)")
            label = UILabel()
            label!.backgroundColor = UIColor.clear
            label!.textAlignment = .center
            
            
            label!.textColor = .black
            label!.adjustsFontSizeToFitWidth = true
            label!.minimumScaleFactor = 0.5
        }
        
        let selectedLabel = pickerView.view(forRow: row, forComponent: component) as? UILabel
        if selectedLabel != nil {
            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0), dispatch_get_main_queue(), ^{
//                // 当前选中的 label
////                UILabel *selectLabel = (UILabel *)[pickerView viewForRow:row forComponent:component];
////                if (selectLabel) {
////                    if (self.selectRowTextColor) {
////                        selectLabel.textColor = [UIColor lightGrayColor];
////                    }
////                    if (self.selectRowTextFont) {
////                        selectLabel.font = [UIFont systemFontOfSize:30];
////                    }
////                } else {
////                    NSLog(@"!.> no select label");
////                }
//                
//            });
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: DispatchWorkItem(block: {
                selectedLabel!.textColor = .lightGray;
                selectedLabel!.font = .systemFont(ofSize: 30);
            }))
        } else {
            print("no selected label")
        }
        
        
        
        label?.text = String(row)
        return label!
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 35
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let view = pickerView.view(forRow: row, forComponent: component)
        //view?.backgroundColor = .lightGray
        let label = view as? UILabel
        print("1")
        self.selectedRow = row;
        //刷新picker，看上面的代理
        pickerView.reloadComponent(component)

    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return String(row)
//    }
    
}

extension JJTimePicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        30
    }
}
