
import UIKit
import SafariServices

class SettingVC: UIViewController {

    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
//    @IBOutlet weak var errorPopUpView: UIView!
//    @IBOutlet weak var errorLabelPopUpView: UILabel!
//    @IBOutlet weak var errorLabel: UILabel!
    
    var charIndex = 0.0
    let visualEffectView = UIVisualEffectView(effect: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpPopupViewCornerRadius(PopUpView: errorPopUpView)
        intialSetup()
        // Do any additional setup after loading the view.
    }
    
    private func intialSetup() {
        setUPVIew(view: view1)
        setUPVIew(view: view2)
        setUPVIew(view: view3)
        setUPVIew(view: view4)
    }
    
    private func setUPVIew(view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderColor = hexStringToUIColor(hex: "333333").cgColor
        view.layer.borderWidth = 1
    }
    
    private func setUpPopupViewCornerRadius(PopUpView: UIView){
        PopUpView.layer.cornerRadius = 25
        PopUpView.layer.masksToBounds = true
        PopUpView.layer.borderWidth = 2
        PopUpView.layer.borderColor = UIColor.gray.cgColor
    }
    
    // MARK: - Blur Method
    private func createBlur(){
//            let blurEffect = UIBlurEffect(style: .extraLight)
            
            visualEffectView.frame = view.bounds
        visualEffectView.backgroundColor = .black
        visualEffectView.alpha = 0.4
//        visualEffectView
            view.addSubview(visualEffectView)
        }
    
    // MARK: - PopUp Methodr
    private func animationIn(desiredView: UIView){
            let backgroundView = self.view!
            
            backgroundView.addSubview(desiredView)
            
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
            desiredView.center = backgroundView .center
            
             UIView.animate(withDuration: 0.3, animations: {
                desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                desiredView.alpha = 1
             })
        }
    //MARK: - buttonaction
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func shareAppBtnTapped(_ sender: Any) {
        MYdevice.shareApp(inController: self)
    }
    
    @IBAction func privacyPolicyBtnTapped(_ sender: Any) {
        let vc = SFSafariViewController(url: MYdevice.privacyPolicyUrl!)
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func tareUsBtnTapped(_ sender: Any) {
        MYdevice.writeReview()
    }
    
    @IBAction func aboutAppBtnTapped(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func CloseBtnTapped(_ sender: Any) {
        visualEffectView.removeFromSuperview()
    }


}
