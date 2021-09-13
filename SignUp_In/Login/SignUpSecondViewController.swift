import UIKit

class SignUpSecondViewController: UIViewController {
    
    @IBOutlet weak var setPhone: UITextField!
    @IBOutlet weak var setBirth: UILabel!
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
