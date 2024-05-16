

import Foundation
import UIKit
import SystemConfiguration

let screenSize = UIScreen.main.bounds.size

enum MYdevice {
    
    static let appID = ""
    static let shareText = "WordVault"
    static let privacyPolicyUrl = URL(string: "https://privacypolicygraphickdesignz.blogspot.com/2022/09/privacy-policy.html")

    static let topAnchor = UIWindow.keyView!.safeAreaInsets.top == 0 ? 0 : UIWindow.keyView!.safeAreaInsets.top
    static let bottomAnchor = UIWindow.keyView?.safeAreaInsets.bottom ?? 0

    static func shareApp(inController controller:UIViewController){
        let textToShare = "\(MYdevice.shareText) \n itms-apps://itunes.apple.com/app\(appID)"
        MYdevice.itemShare(inController: controller, items: textToShare)
    }
        
    static func writeReview() {
        let productURL = URL(string:"itms-apps://itunes.apple.com/app/id"+MYdevice.appID)
        
        var components = URLComponents(url: productURL!, resolvingAgainstBaseURL: false)
        components?.queryItems = [
            URLQueryItem(name: "action", value: "write-review")
        ]
        
        guard let writeReviewURL = components?.url else {
            return
        }
        
        UIApplication.shared.open(writeReviewURL)
    }

    static func itemShare(inController controller:UIViewController, items:Any){
        let objectsToShare = [items]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = controller.view
        activityVC.popoverPresentationController?.sourceRect = CGRect(x: 100, y: 200, width: 300, height: 300)
        controller.present(activityVC, animated: true, completion: nil)
    }

}

// MARK: - HexString to UIColor
func hexStringToUIColor(hex: String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
