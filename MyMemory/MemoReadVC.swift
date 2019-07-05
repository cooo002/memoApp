

//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by 김재석 on 01/07/2019.
//  Copyright © 2019 김재석. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {

    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var pramData : MemoData? // 데이터가 들어올도 있고 안 들어올수도 있으니까
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     self.subject.text = pramData?.title
    self.contents.text = pramData?.contents
    self.img.image = pramData?.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성함"
        let date_string = formatter.string(from: (pramData?.regdate)! )
        self.navigationItem.title = date_string
    }
    
    
    


}
