//
//  MemoListVC.swift
//  MyMemory
//
//  Created by 김재석 on 01/07/2019.
//  Copyright © 2019 김재석. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {
    
     let appDelegat = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let revealVC = self.revealViewController(){
            let btn = UIBarButtonItem(image: UIImage(named: "sidemenu"),
                                      style: .plain,
                                      target: revealVC,
                                      action: #selector(revealVC.revealToggle(_:)))
            self.navigationItem.leftBarButtonItem = btn
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())

        }
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        let count = appDelegat.memoList.count
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // AppDelegate에 저장된 정보를 꺼낸다.
        let row = self.appDelegat.memoList[indexPath.row]
        
        // 그 정보를 프로퍼티 셀에 존재하는 레이블에 저장시켜준다(이미지가 있는 것과 없는 것을 나눠서 생각하자 )
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MemoCell
        
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        // date타입의 값을 strign 타입의 데이터만 담을수 있는 레이브에 표시할려면 변환을 해야한다.
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        cell.regdate?.text = formatter.string(from: row.regdate!)
        
        
        
        

        // Configure the cell...
        
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let get_appDelegate_data = self.appDelegat.memoList[indexPath.row]
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
            
         return
        }
    vc.pramData = get_appDelegate_data
    self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    
    
}
