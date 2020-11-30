//
//  StatusGenerator.swift
//  SimpleHTTPClient Claims
//
//  Created by yeshua z noriega long on 11/29/20.
//  Copyright © 2020 yeshuaNoriega. All rights reserved.
//

import UIKit

class LabelGenerator {
    var lblName : String!
    
    init(n: String) {
        lblName = n
    }
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5   // spacing between stacked views
        
        // start adding UI element
        let lbl = UILabel()
        lbl.text = lblName
        lbl.textAlignment = .right
        
        
        stackView.addArrangedSubview(lbl)
        
        let val = UITextField()
        val.backgroundColor = UIColor.lightGray
        val.layer.borderWidth = 1
        val.layer.borderColor = UIColor.gray.cgColor
        
        stackView.addArrangedSubview(val)
        
        //
        lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        val.setContentHuggingPriority(.defaultLow, for: .horizontal)
        //
        return stackView
    }
}
