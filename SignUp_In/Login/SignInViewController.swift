//
//  SignInViewController.swift
//  SignUp_In
//
//  Created by 이하연 on 2021/09/13.
//

import UIKit

class SignInViewController: UIViewController{
    
    @IBOutlet var logoImageView: UIImageView! {
        didSet{
            logoImageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet var idTextField: UITextField! {
        didSet{
            idTextField.delegate = self
        }
    }
    
    @IBOutlet var pwdTextField: UITextField! {
        didSet{
            pwdTextField.delegate = self
            pwdTextField.textContentType = .newPassword
            pwdTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet var bottomContainerMargin: NSLayoutConstraint!
    
    private var originalBottomMargin: CGFloat = 0
    let userInfomation: UserInfomation = UserInfomation.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalBottomMargin = self.bottomContainerMargin.constant
        addNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if userInfomation.getUserId() != "" {
            idTextField.text = userInfomation.getUserId()
        }
    }
    
    private func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
          let keyboardHeight = keyboardFrame.cgRectValue.height
          let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
          UIView.animate(withDuration: animationDuration){
              self.bottomContainerMargin.constant = keyboardHeight - self.view.safeAreaInsets.bottom
              self.view.layoutIfNeeded()
          }
        }
    }
      
    @objc private func keyboardWillHide(_ notification: Notification) {
        let animvationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animvationDuration) {
            self.bottomContainerMargin.constant = self.originalBottomMargin
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func moveToSignUp(_ sender: UIButton){
        
    }
    
    @IBAction func moveToMain(_ sender: UIButton){
        
    }
    
    
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}

extension SignUpSecondViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}
