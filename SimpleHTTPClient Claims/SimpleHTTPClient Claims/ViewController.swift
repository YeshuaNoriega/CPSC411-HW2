//
//  ViewController.swift
//  SimpleHTTPClient Claims
//
//  Created by yeshua z noriega long on 11/25/20.
//  Copyright © 2020 yeshuaNoriega. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func refreshScreen(cobj: Claim) {
        statusMsg = ""
        statusMsg.append("Claim Title: \(cobj.title), Date: \(cobj.date), ID: \(String(describing: cobj.id))")
    }
    
    var statusMsg : String! = "Default"
    var CService : ClaimService!
    
    @IBOutlet var claimTitle : UITextField!
    @IBOutlet var date : UITextField!
    
    @objc func addClaimStatus(sender: UIButton){
        let claimObj = Claim(this_title: claimTitle.text!, this_date: date.text!)
        CService.addClaim(pObj: claimObj)
        refreshScreen(cobj: claimObj)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //------------------------------- ADD HEADER TO VIEW
        let mainHdr = HeaderLblGenerator()
        let hdr = mainHdr.generate(s: "Please Enter Claim Information")
        
        view.addSubview(hdr)
        
        
        
        //------------------------------- ADD CLAIM INFO STACKVIEWS(INFO) TO VIEW
        let cGen = ClaimDetailGenerator()
        let cView = cGen.generate()

        view.addSubview(cView)
        
        
        //------------------------------- ADD BUTTON TO VIEW
        let addBtn = UIButton()
        addBtn.setTitle("Add", for: .normal)
        addBtn.setTitleColor(UIColor.black, for: .normal)
        addBtn.backgroundColor = UIColor.cyan
        
        view.addSubview(addBtn)
        
        
        //------------------------------- ADD STATUS MESSAGE TO VIEW
        let msg = AddStatusGenerator()
        let aMsg = msg.generate(status: statusMsg)
        
        view.addSubview(aMsg)
        
        
        
        
        //------------------------------- MAKE SPACING EVEN FOR STACKVIEWS(INFO)
        // STEP 1 create the 'vals' array
        let arrViews = cView.arrangedSubviews
        var vals = [UITextField]()
        for sv in arrViews {
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews {
                if ve is UITextField {
                    vals.append(ve as! UITextField)
                }
            }
        }
        // STEP 2 create a contraint for each element in array
        for i in 0...vals.count-1{
            vals[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = vals[i].leadingAnchor.constraint(equalTo: vals[0].leadingAnchor)
            constr.isActive = true
        }
        
        
        
        
        //------------------------------- HEADER CONSTRAINTS
        hdr.translatesAutoresizingMaskIntoConstraints = false
        let topHead = hdr.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        let centerHead = hdr.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        
        
        //------------------------------- STACKVIEW(INFO) CONSTRAINTS
        cView.translatesAutoresizingMaskIntoConstraints = false
        let topV = cView.topAnchor.constraint(equalTo: hdr.bottomAnchor, constant: 20)
        let leftV = cView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let rightV = cView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        
        //------------------------------- BUTTON CONSTRAINTS
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        let topBtn = addBtn.topAnchor.constraint(equalTo: cView.bottomAnchor, constant: 40)
        let rightBtn = addBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10)
        let leftBtn = addBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 275)
        
        //------------------------------- STATUS CONSTRAINTS
        aMsg.translatesAutoresizingMaskIntoConstraints = false
        let topMsg = aMsg.topAnchor.constraint(equalToSystemSpacingBelow: addBtn.bottomAnchor, multiplier: 20)
        let leftMsg = aMsg.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let rightMsg = aMsg.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        
        
        //------------------------------- ENABLE ALL CONSTRAINTS
        topHead.isActive = true
        centerHead.isActive = true
        
        topV.isActive = true
        leftV.isActive = true
        rightV.isActive = true
        
        topBtn.isActive = true
        rightBtn.isActive = true
        leftBtn.isActive = true
        
        topMsg.isActive = true
        leftMsg.isActive = true
        rightMsg.isActive = true
        
        
        //------------------------------- Btn Handeling
        //addBtn.addTarget(self, action: #selector(addClaimButton), for: .touchUpInside)
        
        // retrieve data from server
        addBtn.addTarget(self, action: #selector(addClaimStatus), for: .touchUpInside)
        
        let pService = ClaimService()
        pService.getAll()
        
        //let pList = pService.ClaimList
        
        /*
        pService.addClaim(pObj: Claim(this_title: "First Title", this_date: "2020-10-24"))
        pService.addClaim(pObj: Claim(this_title: "Second Title", this_date: "2020-10-24"))
        pService.addClaim(pObj: Claim(this_title: "Third Title", this_date: "2020-10-24"))
        */
        
        //print(pList)

    }


}

