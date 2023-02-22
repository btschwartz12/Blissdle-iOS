//
//  Game_ViewController.swift
//  Blissdle
//
//  Created by Ben Schwartz on 5/8/22.
//

import UIKit



class Game_ViewController: UIViewController {

    
    @IBOutlet weak var letterLabel_1: UILabel!
    @IBOutlet weak var letterLabel_2: UILabel!
    @IBOutlet weak var letterLabel_3: UILabel!
    @IBOutlet weak var letterLabel_4: UILabel!
    @IBOutlet weak var letterLabel_5: UILabel!
    
    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var word_field: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    
    
    
    let colors: [CGColor] = [
        UIColor.lightGray.cgColor,
        CGColor(srgbRed: 225, green: 225, blue: 0, alpha: 0.6),
        CGColor(srgbRed: 0, green: 225, blue: 0, alpha: 0.6)]
    var states: [Int] = [0, 0, 0, 0, 0]
    
// do i need this?
//    var textFieldActive: Bool = false
    
    let _blissdle = Blissdle()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      title = "Game robby"
        initialize()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension Game_ViewController {
    
    func initialize() {
        setup_view()
        
        textView.text = "Piper dog\n"
        

//        _blissdle.print_pips()
    }
    
    
    func setup_view() {

        setup_letterLabels()
        
        // adjusting text field
//        textFieldActive = true
//        word_field.text = word_str
        word_field.layer.opacity = 0.5
//        word_field.becomeFirstResponder()
        word_field.autocorrectionType = UITextAutocorrectionType.no
        
    }
}

extension Game_ViewController {
    
    @IBAction func word_button(_ sender: Any) {
        
        guard let word = word_field.text else { return }
        guard word.count == 5 else { return  }
       
        _blissdle.print_pips()
        
//        textFieldActive = true
        word_field.resignFirstResponder()
        textView.text += "The word is \(word)\n"
    }
    
    @IBAction func reset_word(_ sender: Any) {
        
        let labels: [UILabel] = [letterLabel_1, letterLabel_2, letterLabel_3, letterLabel_4, letterLabel_5]
        
        for (i, label) in labels.enumerated() {
            label.layer.backgroundColor = colors[0]
            states[i] = 0
            label.text = ""
        }
        
        word_field.text = ""
    }
    
    @IBAction func edit_changed(_ sender: Any) {
        
        let entry: String = word_field.text!
        
        if let last = entry.last {
            if !last.isLetter {
                word_field.text = String(entry.dropLast());
                return
            }
        }
        
        
        
        let labels: [UILabel] = [letterLabel_1, letterLabel_2, letterLabel_3, letterLabel_4, letterLabel_5]
        
        
        
    
        if entry.count > 5 {
            word_field.text = String(entry.dropLast())
            return
        }
        
        for (index, char) in entry.enumerated() {
            labels[index].text = char.uppercased()
        }
        
        for (index, label) in labels.enumerated() {
            if (entry.count - 1 < index) {
                label.text = ""
            }
        }

    }
    
    
}

extension Game_ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        word_button(self)
        return false
    }
}

// MARK: Letter Labels
extension Game_ViewController {
    
    func setup_letterLabels() {
        
        let labels: [UILabel] = [letterLabel_1, letterLabel_2, letterLabel_3, letterLabel_4, letterLabel_5]
        for label in labels {
            
            label.layer.backgroundColor = colors[0]
            label.layer.borderColor = UIColor.black.cgColor
            label.layer.borderWidth = 2.0
            label.text = ""
            label.isUserInteractionEnabled = true
        }
        letterLabel_1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Game_ViewController.tap_1)))
        letterLabel_2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Game_ViewController.tap_2)))
        letterLabel_3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Game_ViewController.tap_3)))
        letterLabel_4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Game_ViewController.tap_4)))
        letterLabel_5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Game_ViewController.tap_5)))

    }
    
    @objc func tap_1(sender:UITapGestureRecognizer) {
        if !word_field.isFirstResponder {
            word_field.becomeFirstResponder()
            return
        }
        states[0] = (states[0] + 1) % 3
        letterLabel_1.layer.backgroundColor = colors[states[0]]
    }
    @objc func tap_2(sender:UITapGestureRecognizer) {
        if !word_field.isFirstResponder {
            word_field.becomeFirstResponder()
            return
        }
        states[1] = (states[1] + 1) % 3
        letterLabel_2.layer.backgroundColor = colors[states[1]]
    }
    @objc func tap_3(sender:UITapGestureRecognizer) {
        if !word_field.isFirstResponder {
            word_field.becomeFirstResponder()
            return
        }
        states[2] = (states[2] + 1) % 3
        letterLabel_3.layer.backgroundColor = colors[states[2]]
    }
    @objc func tap_4(sender:UITapGestureRecognizer) {
        if !word_field.isFirstResponder {
            word_field.becomeFirstResponder()
            return
        }
        states[3] = (states[3] + 1) % 3
        letterLabel_4.layer.backgroundColor = colors[states[3]]
    }
    @objc func tap_5(sender:UITapGestureRecognizer) {
        if !word_field.isFirstResponder {
            word_field.becomeFirstResponder()
            return
        }
        states[4] = (states[4] + 1) % 3
        letterLabel_5.layer.backgroundColor = colors[states[4]]
    }
}

