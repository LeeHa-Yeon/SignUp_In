//
//  SignUpViewController.swift
//  SignUp_In
//
//  Created by 이하연 on 2021/09/13.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let userInfomation: UserInfomation = UserInfomation.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
    }
    
    @IBOutlet var profileImageView: UIImageView! {
        didSet{
            profileImageView.layer.cornerRadius = 20
            profileImageView.backgroundColor = #colorLiteral(red: 0.8100145459, green: 0.9372221828, blue: 0.9840880036, alpha: 1)
        }
    }
    
    // MARK:  - 사진 등록하기
    // alert 선택창
    @IBAction func postProfile(_ sender: Any) {
        let alert = UIAlertController(title:"선택해주세요.", message: "", preferredStyle: .actionSheet)
        let library = UIAlertAction(title:"사진 앨범", style: .default){
            (action) in self.openLibrary()
        }
        let camera = UIAlertAction(title:"카메라", style: .default){ (action) in self.openCamera()
            
        }
        let cancel = UIAlertAction(title: "취소",style: .cancel, handler: nil)

        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    // imagePicker
    lazy var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        return imagePicker
    }()
    
    func openLibrary(){
        imagePicker.modalPresentationStyle = .fullScreen
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: false, completion: nil)
    }
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            imagePicker.modalPresentationStyle = .fullScreen
            imagePicker.sourceType = .camera
            present(imagePicker, animated: false, completion: nil)
        }
        else{
            print("Camera not available")
        }
    }
    

    // 아이디, 비밀번호, 비밀번호 확인, 자기소개, 버튼1, 버튼 2
    
    @IBOutlet var idTextField: UITextField! {
        didSet{
            idTextField.placeholder = "ID"
            idTextField.delegate = self
        }
    }
    
    @IBOutlet var pwdTextField: UITextField! {
        didSet{
            pwdTextField.placeholder = "Password"
            pwdTextField.delegate = self
            pwdTextField.textContentType = .newPassword
            pwdTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet var pwdCheckTextField: UITextField! {
        didSet{
            pwdCheckTextField.placeholder = "Check password"
            pwdCheckTextField.delegate = self
            pwdCheckTextField.textContentType = .newPassword
            pwdCheckTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet var introduceTextView: UITextView! {
        didSet{
            introduceTextView.delegate = self
            introduceTextView.layer.cornerRadius = 10
            introduceTextView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            introduceTextView.backgroundColor = #colorLiteral(red: 0.9087265134, green: 0.917000711, blue: 1, alpha: 1)
            introduceTextView.text = "자기소개를 작성해주세요. "
        }
    }
    @IBAction func cancleButton(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }

    // 회원정보 저장
    @IBAction func nextButton(_ sender: UIButton){
        guard let inputId = idTextField.text else { popUpAlert(target: "아이디를 기입해주세요"); return}
        guard let inputPwd = pwdTextField.text else { popUpAlert(target: "비밀번호를 기입해주세요"); return}
        guard let inputPwdCheck = pwdCheckTextField.text else { popUpAlert(target: "비밀번호 확인 기입해주세요"); return}
        guard let inputIntroduce = introduceTextView.text else { popUpAlert(target: "자기소개를 기입해주세요"); return}
        guard let uploadImage = profileImageView.image else { popUpAlert(target: "이미지를 등록해주세요"); return}
        
        
        if inputPwd == inputPwdCheck {
            userInfomation.registUserId(id: inputId)
            userInfomation.registUserPwd(password: inputPwd)
            userInfomation.registUserProfile(profile: uploadImage)
            userInfomation.registUserIntroduce(introduce: inputIntroduce)
        }else{
            popUpAlert(target: "비밀번호를 다시 확인해주세요.");
        }
    }
    
    // MARK: - GestureRecognizer
    // 화면 탭하면 키보드 내려간다.
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        self.idTextField.resignFirstResponder()
        self.pwdTextField.resignFirstResponder()
        self.pwdCheckTextField.resignFirstResponder()
        self.introduceTextView.resignFirstResponder()
    }
    
    func popUpAlert(target: String){
        let alert = UIAlertController(title:"모두 기입해주세요.", message: "\(target)", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "확인", style: .default, handler:nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

}


extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.profileImageView.image = editedImage
        }else if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.profileImageView.image = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension SignUpViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}
