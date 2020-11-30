//
//  storyboardViewController.swift
//  SimpleHTTPClient Claims
//
//  Created by yeshua z noriega long on 11/29/20.
//  Copyright © 2020 yeshuaNoriega. All rights reserved.
//

import UIKit

class storyboardViewcontroller : UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var claimTitle: UITextField!
    @IBOutlet weak var Date: UITextField!
    
    @IBOutlet weak var StatusView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        claimTitle.delegate = self
        Date.delegate = self
        
    }
    
    @IBAction func AddTapped(_ sender: Any) {
        let CService = ClaimService()
        let cObj = Claim(this_title: String(claimTitle.text!), this_date: String(Date.text!))
        CService.getAll()
        CService.addClaim(pObj: cObj)
        
        StatusView.text = "< Claim Title: \(String(claimTitle.text!))\nDate: \(String(Date.text!)) \n*SHOULD HAVE BEEN* added to the database >"
    }
    
}

extension ViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
