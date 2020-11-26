//
//  UIEditorViewController.swift
//  SimpleHTTPClient Claims
//
//  Created by yeshua z noriega long on 11/25/20.
//  Copyright © 2020 yeshuaNoriega. All rights reserved.
//

import UIKit

class UIEditorViewcontroller: UIViewController {
    
    @IBOutlet var statusVal : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // POPULATE A DEFAULT STATUS
        statusVal.text = "< Status Message >"
        
        
    }
}
