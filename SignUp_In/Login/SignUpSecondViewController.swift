import UIKit

class SignUpSecondViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet var phoneTextView: UITextField!{
        didSet{
            phoneTextView.delegate = self
            phoneTextView.keyboardType = . numberPad
        }
    }
    
//    @IBOutlet weak var datePicker: UIDatePicker!
//    @IBOutlet weak var setPhone: UITextField!
//    @IBOutlet weak var setBirth: UILabel!
//
//    let dateFormatter: DateFormatter = {
//        let formatter: DateFormatter = DateFormatter()
//        formatter.dateStyle = .medium
//        return formatter
//    }()
//
//    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
//        let date: Date = self.datePicker.date
//        let dateString: String = self.dateFormatter.string(from: date)
//
//        self.setBirth.text = dateString
//
//    }
//
//    @IBAction func BackButton(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
//        tapGesture.delegate = self
//
//        self.view.addGestureRecognizer(tapGesture)
//    }
//
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        self.view.endEditing(true)
//        return true
//    }

}
