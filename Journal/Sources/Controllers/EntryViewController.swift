//
//  ViewController.swift
//  Journal
//
//  Created by Bum JunKwon on 21/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import UIKit
import SnapKit


class EntryViewController: UIViewController {

    @IBOutlet weak var button: UIBarButtonItem!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!

    
    var environment: Environment!
//    let journal: EntryRepository = InMemoryRepository.shared
    private var editingEntry: Entry?
    
    fileprivate func updateSubviews(for isEditing: Bool) {
        if isEditing {
            textView.isEditable = true
            textView.becomeFirstResponder()
            
            button.image = #imageLiteral(resourceName: "baseline_save_white_24pt")
            button.target = self
            button.action = #selector(saveEntry(_:))
        }
        else {
            textView.isEditable = false
            textView.resignFirstResponder()
            
            button.image = #imageLiteral(resourceName: "baseline_edit_white_24pt")
            button.target = self
            button.action = #selector(editEntry(_:))
        }
    }
    
    @objc func saveEntry(_ sender: Any) {
        if let oldEntry = self.editingEntry {
            var oldEntryVar = oldEntry
            oldEntryVar.text = textView.text
            environment.entryRepository.update(oldEntryVar)
            
        } else {
            let newEntry: Entry = Entry(text: textView.text)
            environment.entryRepository.add(newEntry)
            editingEntry = newEntry
        }
        updateSubviews(for: false)
//        let entry: Entry = Entry(text: textView.text)
//        environment.entryRepository.add(entry)
////        dateLable.text = DateFormatter.entryDateFormatter.string(from: entry.createdAt)
//        updateSubviews(for: false)
    }
    
    
    //    logo가 뜬 후 컨트롤이 가능한 view가 불러와지는점시점
    override func viewDidLoad() {
        super.viewDidLoad()
        title = DateFormatter.entryDateFormatter.string(from: Date())

//        dateLable.text = DateFormatter.entryDateFormatter.string(from: Date())
        textView.isEditable = true
        textView.becomeFirstResponder()
        
        button.image = #imageLiteral(resourceName: "baseline_save_white_24pt")
        button.target = self
        button.action = #selector(saveEntry(_:))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_ :)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_ :)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }
    @objc func keyboardWillShow(_ note: Notification) {
        guard
            let userInfo = note.userInfo,
            let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue),
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
            let animationCurve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
        else { return }
        
//        print("키보드높이: \(keyboardFrame.cgRectValue.height)")
        
        let keyboardHeight: CGFloat = keyboardFrame.cgRectValue.height
        let animationOption = UIViewAnimationOptions(rawValue: animationCurve)
        
        UIView.animate(withDuration: duration, delay: 0, options: animationOption, animations: {
            self.textViewBottomConstraint.constant = -keyboardHeight
            self.view.layoutIfNeeded()
        }, completion: nil
        )
    }

    
    @objc func keyboardWillHide(_ note: Notification) {
        guard
            let userInfo = note.userInfo,
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
            let animationCurve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
            else { return }
        
        let animationOption = UIViewAnimationOptions(rawValue: animationCurve)
        
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: animationOption,
            animations: {
                self.textViewBottomConstraint.constant = 0
                self.view.layoutIfNeeded()
        },
            completion: nil
        )
        
    }
    
    // view가 나올때마다 여러번 호출될수잇음
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textView.becomeFirstResponder() // 키보드를 화면에 들어올때 올림
    }
    
    @objc func editEntry(_ sender: Any) {
        updateSubviews(for: true)
    }

}

extension DateFormatter {
    static var entryDateFormatter: DateFormatter = {
        let df  = DateFormatter()
        df.dateFormat = "yyyy. MM. dd. EEE"
        return df
    }()
}
