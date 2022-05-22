//
//  ViewController.swift
//  UIDemo
//
//  Created by jake on 2022/5/11.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var animationView:UILabel?
    var animationBtn:UIButton?
    
    var timepicker:JJTimePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        animationBtn?.backgroundColor = .lightGray
        animationBtn?.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.view.addSubview(animationBtn!)
        
        animationView = UILabel(frame: CGRect(x: 50, y: 220, width: 100, height: 40))
        animationView?.text = "我要测试一下文字效果"
        animationView?.alpha = 0;
        self.view.addSubview(animationView!)
        
        timepicker = JJTimePicker()
        self.view.addSubview(timepicker!)
        timepicker!.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(400)
        }
    }
    
    
    @objc func tap(sender:UIButton!) {
        print("!.")
        let frame = self.animationView?.frame
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            self.animationView?.frame = CGRect(x: frame!.origin.x + 50, y: frame!.origin.y, width: frame!.size.width, height: frame!.size.height)
            self.animationView?.alpha = 1;
        } completion: { Bool in
            self.animationView?.alpha = 0;
        }
    }
}

