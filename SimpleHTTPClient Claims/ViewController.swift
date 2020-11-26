//
//  ViewController.swift
//  SimpleHTTPClient Claims
//
//  Created by yeshua z noriega long on 11/25/20.
//  Copyright © 2020 yeshuaNoriega. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pService = ClaimService()
        pService.getAll()
        
        let pList = pService.ClaimList
        
        pService.addClaim(pObj: Claim(this_title: "First Title", this_date: "2020-10-24"))
        pService.addClaim(pObj: Claim(this_title: "Second Title", this_date: "2020-10-24"))
        pService.addClaim(pObj: Claim(this_title: "Third Title", this_date: "2020-10-24"))
        
        print(pList)
    }


}

