//
//  ProfileVC.swift
//  MyMemory
//
//  Created by 김재석 on 17/07/2019.
//  Copyright © 2019 김재석. All rights reserved.
//

import Foundation
import UIKit

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let profileImage = UIImageView()
    let tv = UITableView()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.accessoryType = .disclosureIndicator
        
        
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "이름"
            cell.detailTextLabel?.text = "김재석"
            
            
        case 1:
            cell.textLabel?.text = "계졍"
            cell.detailTextLabel?.text = "ynwa3690@gmail.com"
          

        default:
            ()
        }
        return cell
        
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backBtn = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(close(_:)))
        self.navigationItem.leftBarButtonItem = backBtn
        
        let image = UIImage(named: "account.jpg")
        profileImage.frame.size = CGSize(width: 100, height: 100)
        profileImage.center = CGPoint(x: (self.view.frame.width)/2 , y: 280)
        profileImage.image = image
        
        self.profileImage.layer.cornerRadius = self.profileImage.frame.width/2
        self.profileImage.layer.borderWidth = 0
        self.profileImage.layer.masksToBounds = true
        self.view.addSubview(self.profileImage)
        
        self.tv.frame = CGRect(x: 0, y: self.profileImage.frame.origin.y + self.profileImage.frame.size.height , width: self.view.frame.width, height: 100)
        self.tv.dataSource = self
        self.tv.delegate = self
        self.view.addSubview(self.tv)
        
        let bg = UIImage(named: "profile-bg")
        let bgImg = UIImageView(image: bg)
        
        bgImg.frame.size = CGSize(width: bgImg.frame.size.width, height: bgImg.frame.size.height)
        bgImg.center = CGPoint(x: self.view.frame.width/2, y: 50)
        bgImg.layer.cornerRadius = bgImg.frame.size.width / 2
        bgImg.layer.borderWidth = 0
        bgImg.layer.masksToBounds = true
        self.view.addSubview(bgImg)
        
        self.view.bringSubviewToFront(self.tv)
        self.view.bringSubviewToFront(self.profileImage)
        
        
        
    }
    
    @objc func close(_ sender: Any){
        self.presentingViewController?.dismiss(animated: true)//프레젠트 방식에서는 자신을 호출한 뷰 컨틀로러에세 현재 화면을 걷어달라고해야 프레젠트 방식으로 표현된 뷰 컨트롤러가 걷히게 된다.
        
    }
}
