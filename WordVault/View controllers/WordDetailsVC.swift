//
//  WordDetailsVC.swift
//  WordVault
//
//  Created by Mac on 10/06/23.
//

import UIKit
import AVFoundation


class WordDetailsVC: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var wordDetailsLbl: UILabel!
    @IBOutlet weak var wordLbl: UILabel!
    @IBOutlet weak var volumeBtn: UIButton!
    
    //MARK: - variable declaration
    var word = ""
    var wordDetails = ""
    let synthesizer = AVSpeechSynthesizer()
    var isSpeak = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wordLbl.text = word
        wordDetailsLbl.text = wordDetails
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopSpeech()
    }
    //MARK: - function
    func readLabelText() {
        let speechUtterance = AVSpeechUtterance(string: wordDetailsLbl.text ?? "")
        synthesizer.speak(speechUtterance)
    }
    
    func stopSpeech() {
        synthesizer.stopSpeaking(at: .immediate)
    }


    //MARK: - button action
    @IBAction func backBtnTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        if isSpeak == false {
            readLabelText()
            isSpeak = true
            if #available(iOS 13.0, *) {
                volumeBtn.setBackgroundImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
            } else {
                // Fallback on earlier versions
            }
        } else {
            stopSpeech()
            if #available(iOS 13.0, *) {
                volumeBtn.setBackgroundImage(UIImage(systemName: "speaker.wave.3.fill"), for: .normal)
            } else {
                // Fallback on earlier versions
            }
            isSpeak = false
        }
            
        
    }

    
}
