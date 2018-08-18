//
//  TimelineViewController.swift
//  Journal
//
//  Created by Bum JunKwon on 18/08/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    @IBOutlet weak var entryCountLable: UILabel!
    
    var environment: Environment!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "addEntry":
            let entryVC = segue.destination as? EntryViewController
            entryVC?.environment = environment
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Journal"
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        let journal = environment.entryRepository
        entryCountLable.text = "entry: \(environment.entryRepository.numberOfEntries)"
    }
}

