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

    
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!

    let journal: Journal = InMemoryJournal()
    private var editingEntry: Entry?
    
    fileprivate func updateSubviews(for isEditing: Bool) {
        if isEditing {
            textView.isEditable = true
            textView.becomeFirstResponder()
            button.setTitle("저장", for: .normal)
            button.addTarget(self, action: #selector(saveEntry(_:)), for: .touchUpInside)
            
        }
        else {
            textView.isEditable = false
            textView.resignFirstResponder()
            button.setTitle("수정", for: .normal)
            button.addTarget(self, action: #selector(editEntry), for: .touchUpInside)
        }
    }
    
    @objc func saveEntry(_ sender: Any) {
        let entry: Entry = Entry(text: textView.text)
        journal.add(entry)
        dateLable.text = DateFormatter.entryDateFormatter.string(from: entry.createdAt)
        updateSubviews(for: false)
    }
    
    
    //    logo가 뜬 후 컨트롤이 가능한 view가 불러와지는점시점
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLable.text = DateFormatter.entryDateFormatter.string(from: Date())
        button.addTarget(self, action: #selector(saveEntry(_:)), for: .touchUpInside)
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
