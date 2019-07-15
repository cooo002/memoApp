//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by 김재석 on 01/07/2019.
//  Copyright © 2019 김재석. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate{
    var subject: String!//note 내용 첫줄이 저장되고 이렇게 저장되는 문자열이 제목이 된다.
    
    var logcheckNummber = 0
    @IBOutlet weak var contents: UITextView!
    
    @IBOutlet weak var preview: UIImageView!
    
    
    @IBAction func save(_ sender: Any) {
        guard self.contents.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "메모할 내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        let data = MemoData()
        
        data.title = self.subject // title은 ?를 붙여서 붙여서 옵셔널 타입의 데이터만을 저장할 수 있는데 subject는 !를 붙인 오셔널 타입이기 때문에 할당이 가능하다
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
          self.navigationController?.popViewController(animated: true)//
//        let AppDelegateSaveInfo = appDelegate.memoList[logcheckNummber].contents!//데이터가 appDelegate에 잘 저장되었나 확인용
//        
//        NSLog(AppDelegateSaveInfo)//데이터가 appDelegate에 잘 저장되었나 확인용
//        
//        logcheckNummber+=1//데이터가 appDelegate에 잘 저장되었나 확인용(이 코드는 그냥 내가 실제 저장되는지 확인하고싶어서 만든것)
        
    }
    
    @IBAction func pick(_ sender: Any) {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contents.delegate = self
        let bgImg = UIImage(named: "memo-background.png")!
        self.view.backgroundColor = UIColor(patternImage: bgImg)
        self.contents.layer.borderWidth = 0
        self.contents.layer.borderColor = UIColor.clear.cgColor
        self.contents.layer.backgroundColor = UIColor.clear.cgColor
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 9
        self.contents.attributedText = NSAttributedString(string: " ", attributes: [NSAttributedString.Key.paragraphStyle : style])
        self.contents.text = ""
        

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      //여기 추가하기
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        picker.dismiss(animated: false)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = ((contents.length > 15) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        self.navigationItem.title = subject
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
