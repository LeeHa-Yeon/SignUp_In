import UIKit

class SignUpSecondViewController: UIViewController,UIGestureRecognizerDelegate {
    
    let userInfomation: UserInfomation = UserInfomation.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self

        self.view.addGestureRecognizer(tapGesture)
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBOutlet var phoneTextView: UITextField!{
        didSet{
            phoneTextView.delegate = self
            phoneTextView.keyboardType = . numberPad
        }
    }
    
    @IBOutlet var birthLabel: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        self.birthLabel.text = dateString
        
    }
    
    // TODO: - 회원정보 저장하지 않은채 로그인 화면으로 이동
    @IBAction func cancelButton(_ sender: Any){
    }
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // TODO: - 회원정보 저장하고 로그인 화면으로 이동
    // 로그인 화면에 id 넣어두기
    @IBAction func doneButton(_ sender: Any){
        
    }

}
