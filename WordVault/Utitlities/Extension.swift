

import Foundation
import UIKit
import Foundation

extension UIView {
    
    var safeTopAnchor: CGFloat {
        return self.safeAreaInsets.top
    }
    
    var safeBottomAnchor: CGFloat {
        return self.safeAreaInsets.bottom
    }
    
    func setTopNavigation() {
        self.frame.size.height = 45 + MYdevice.topAnchor
    }
    
    func setUPPickerView(){
            self.frame = CGRect(x: 0, y:screenSize.height, width:screenSize.width, height: 200)
            self.backgroundColor = .red
            self.tintColor = .white
    }
    
    func pickerViewHideAndShow(isHide:Bool){
        
        let ypoint = isHide ? screenSize.height : screenSize.height - self.frame.height
        
        UIView.animate(withDuration: 0.3) {
            self.frame.origin.y = ypoint
        }
        
    }
}


extension UIWindow {
    
    static var keyView: UIWindow? {
        return UIApplication.shared.windows[0]
    }
}


extension UIViewController{
    
    func alert(message: String) {
    
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


extension UILabel{
    
    func setLabelPreview(){
        self.layer.borderColor = UIColor.darkGray.withAlphaComponent(0.2).cgColor
        self.layer.borderWidth = 1
        self.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.backgroundColor = .white
    }
}

extension String {
    
    func stringToInt()->Int {
        return Int(self)!
    }
}

extension Int {
    func toString() -> String {
        String(self)
    }
}


extension Bool{
    func isProfit()-> String{
        if self{
            return "Profit"
        }
        
        return "Loss"
    }
}
