//
//  File.swift
//  MyMemory
//
//  Created by 김재석 on 15/07/2019.
//  Copyright © 2019 김재석. All rights reserved.
//

import Foundation
import UIKit

public enum CSLogType: Int{
    case basic
    case title
    case tag
    
}

class CSLogButton: UIButton {
    
    var logType : CSLogType = .title
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setBackgroundImage(UIImage(named: "button-bg"), for: .normal)
        self.tintColor = .white
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
        

        
        
    }
    @objc
    func logging(_ sender : UIButton){
        switch logType {
            
        case .basic:
            NSLog("버튼이 클리되었습니댜 ")
        case .title:
            let title = self.titleLabel?.text ?? "타이틀 지정 안됨"
            
            NSLog(title)
        case .tag:
            
            NSLog("\(sender.tag)라는 태크가 지정되어 있습니다  ")
            
            
    
        }
        
    }
    
}
