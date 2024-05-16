

import UIKit

class ViewController: UIViewController {
//MARK: - Outlet
    @IBOutlet weak var dataTbl: UITableView!
   
    //MARK: - variable declaration
    var arrDicData: [DicData] = []
    var book: [DicData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        intialSetup()
        
    }
    //MARK: - Button action
    @IBAction func settingBtnTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    //MARK: - function
    private func intialSetup() {
        guard let jsonURL = Bundle.main.url(forResource: "dicts", withExtension: "json") else {
            // Handle error: JSON file not found
            return
        }
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            let parsedData = try decoder.decode([DicData].self, from: jsonData)
            arrDicData = parsedData.shuffled()
            dataTbl.reloadData()
//            dump(parsedData)
        } catch {
            // Handle error: Unable to read JSON file
            print("Error reading JSON file: \(error)")
            return
        }

    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDicData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  dataTbl.dequeueReusableCell(withIdentifier: "DataTblCell", for: indexPath) as! DataTblCell
        cell.wordLbl.text = arrDicData[indexPath.row].word
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "WordDetailsVC") as! WordDetailsVC
        VC.word = arrDicData[indexPath.row].word ?? ""
        VC.wordDetails = arrDicData[indexPath.row].definition ?? ""
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
