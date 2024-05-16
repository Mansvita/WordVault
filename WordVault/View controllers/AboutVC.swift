

import UIKit

class AboutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func BackBTTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }


}
