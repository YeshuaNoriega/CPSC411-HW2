//
//  ClaimDetailGenerator.swift
//  SimpleHTTPClient Claims
//
//  Created by yeshua z noriega long on 11/29/20.
//  Copyright © 2020 yeshuaNoriega. All rights reserved.
//

import UIKit

class ClaimDetailGenerator {
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 2
        
        var lblGenerator = LabelGenerator(n: "Claim Title")
        var lblView = lblGenerator.generate()
        stackView.addArrangedSubview(lblView)
        
        lblGenerator = LabelGenerator(n: "Date")
        lblView = lblGenerator.generate()
        stackView.addArrangedSubview(lblView)
        
        return stackView
    }
}
