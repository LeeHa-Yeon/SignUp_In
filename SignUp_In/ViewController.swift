//
//  ViewController.swift
//  SignUp_In
//
//  Created by 이하연 on 2021/09/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var pwdCheckLabel: UILabel!
    @IBOutlet weak var inforLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 화면에 보이기 직전에 데이터를 세팅해주는게 좋겠지?
    // viewWillAppear에 데이터를 세팅해주자
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        self.idLabel.text = UserInformation.shared.id
        self.pwdLabel.text = UserInformation.shared.pwd
        self.pwdCheckLabel.text = UserInformation.shared.pwdCheck
        self.inforLabel.text = UserInformation.shared.information
        
        print("\(idLabel.text!)")
        print("\(pwdLabel.text!)")
        print("\(pwdCheckLabel.text!)")
        print("\(inforLabel.text!)")
        
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
 
