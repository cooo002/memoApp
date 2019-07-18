//
//  SideBarVC.swift
//  MyMemory
//
//  Created by 김재석 on 17/07/2019.
//  Copyright © 2019 김재석. All rights reserved.
//

import Foundation
import UIKit

class SideBarVC: UITableViewController {
    
    let titles = ["새글 작성하기",
                  "친구 새글",
                  "달력으로 보기",
                  "공지사항",
                  "통계",
                  "계정 관리"
    ]
    let icons = [
    UIImage(named: "icon01"),
    UIImage(named: "icon02"),
    UIImage(named: "icon03"),
    UIImage(named: "icon04"),
    UIImage(named: "icon05"),
    UIImage(named: "icon06")
    ]
    
    let emailLabel = UILabel()
    let nameLabel = UILabel()
    let profileImage = UIImageView()

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "menucell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let memoFormVC = self.storyboard?.instantiateViewController(withIdentifier: "MemoForm")
            let frontVC = self.revealViewController()?.frontViewController as? UINavigationController
            frontVC?.pushViewController(memoFormVC!, animated: true)
            self.revealViewController()?.revealToggle(self)
            }
        else if indexPath.row == 5{
            let ProfileNavigationVC = self.storyboard?.instantiateViewController(withIdentifier: "_Profile")
            self.present(ProfileNavigationVC!, animated: true){// 여기서의 self는 SWRevealVeiwController를 의미한다.
                
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        headerView.backgroundColor = .gray
        
        self.nameLabel.frame = CGRect(x: 70, y: 15, width: 100, height: 30)
        self.nameLabel.text = "김재석님"
        self.nameLabel.textColor = .white
        self.nameLabel.font = UIFont.systemFont(ofSize: 15)
        self.nameLabel.backgroundColor = UIColor.clear
        headerView.addSubview(nameLabel)
        
        self.emailLabel.frame = CGRect(x: 70, y: 30, width: 100, height: 30)
        self.emailLabel.text = "ynwa3690@gmial.com"
        self.emailLabel.textColor = .white
        self.emailLabel.font = UIFont.systemFont(ofSize: 13)
        self.emailLabel.backgroundColor = UIColor.clear
        headerView.addSubview(emailLabel)
        
        let img = UIImage(named: "account.jpg")
        self.profileImage.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        self.profileImage.image = img
        self.profileImage.layer.cornerRadius = self.profileImage.frame.width/2
        self.profileImage.layer.borderWidth = 0
        self.profileImage.layer.masksToBounds = true
        headerView.addSubview(profileImage)
        
        
        self.tableView.tableHeaderView = headerView
        
        
        
        
        
        
    }
    
}
