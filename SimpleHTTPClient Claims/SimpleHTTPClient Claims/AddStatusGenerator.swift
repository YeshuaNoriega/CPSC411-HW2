//
//  AddStatusGenerator.swift
//  SimpleHTTPClient Claims
//
//  Created by yeshua z noriega long on 11/29/20.
//  Copyright © 2020 yeshuaNoriega. All rights reserved.
//

import UIKit

class AddStatusGenerator{
    
    func generate(status: String) -> UIStackView {
        let statusStack = UIStackView()
        
        
        let statONE = UILabel()
        statONE.text = "Status:"
        statONE.textAlignment = .left
        
        statusStack.addArrangedSubview(statONE)
        
        
        let statusLabel = UILabel()
        statusLabel.text = "< \(status) >"
        
        statusStack.addArrangedSubview(statusLabel)
        
        return statusStack
    }
}
