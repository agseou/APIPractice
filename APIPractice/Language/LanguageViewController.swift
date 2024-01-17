//
//  LanguageViewController.swift
//  APIPractice
//
//  Created by 은서우 on 2024/01/17.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet var sourceLang: UILabel!
    @IBOutlet var targetLang: UILabel!
    @IBOutlet var changeBtn: UIButton!
    @IBOutlet var textView: UITextView!
    @IBOutlet var transLabel: UILabel!
    @IBOutlet var transBtn: UIButton!
    
    let manager = PapagoAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transBtn.addTarget(self, action: #selector(tapChageBtn), for: .touchUpInside)
    }
    
    @objc func tapChageBtn(){
        guard let text = textView.text else {
            return
        }
        
        manager.callRequest(text: text) { value in
            self.transLabel.text = value.message.result.translatedText
            self.sourceLang.text = value.message.result.srcLangType
            self.targetLang.text = value.message.result.tarLangType
        }
        view.endEditing(true)
    }

}

extension LanguageViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        textView.textColor = .black
    }
}
