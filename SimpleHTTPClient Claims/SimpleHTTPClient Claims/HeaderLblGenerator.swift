//
//  HeaderLblGenerator.swift
//  SimpleHTTPClient Claims
//
//  Created by yeshua z noriega long on 11/29/20.
//  Copyright © 2020 yeshuaNoriega. All rights reserved.
//

import UIKit

class HeaderLblGenerator {
    func generate(s: String) -> UILabel {
        let hdr = UILabel()
        hdr.text = s
        hdr.textAlignment = .center
        hdr.textColor = UIColor.systemBlue
        hdr.font = UIFont.boldSystemFont(ofSize: 20)
        return hdr
    }
}
