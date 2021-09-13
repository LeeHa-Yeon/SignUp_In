//
//  SignUpViewController.swift
//  SignUp_In
//
//  Created by 이하연 on 2021/09/13.
//

import UIKit

class SignUpViewController: UIViewController, UINavigationControllerDelegate {


    @IBOutlet weak var setID: UITextField!
    @IBOutlet weak var setPWD: UITextField!
    @IBOutlet weak var checkPWD: UITextField!
    @IBOutlet weak var setIntroduction: UITextView!
    @IBOutlet weak var setProfile: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

    }
    
    func openLibrary(){
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: false, completion: nil)
    }
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            imagePicker.sourceType = .camera
            present(imagePicker, animated: false, completion: nil)
        }
        else{
            print("Camera not available")
        }
    }
    @IBAction func addProfile(_ sender: Any) {
        let alert = UIAlertController(title: "",message: "",preferredStyle: .actionSheet)
        
        let library = UIAlertAction(title: "사진 앨범", style: .default) { (action) in self.openLibrary()
        }
        
        let camera = UIAlertAction(title:"카메라",style: .default){ (action) in self.openCamera()}
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func signUpCancle(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 회원 정보 데이터 저장
    @IBAction func sendInfo(_ sender: Any) {
        UserInformation.shared.id = setID.text
        UserInformation.shared.pwd = setPWD.text
        UserInformation.shared.pwdCheck = checkPWD.text
        UserInformation.shared.information = setIntroduction.text    
    }
    
}

extension SignUpViewController:     UIImagePickerControllerDelegate, UINavigationBarDelegate{
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage{
            setProfile.image = image
            
            print(info)
        }
        dismiss(animated: true, completion: nil)
    }

}
