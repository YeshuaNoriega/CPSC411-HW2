//
//  ClaimService.swift
//  SimpleHTTPClient Claims
//
//  Created by yeshua z noriega long on 11/25/20.
//  Copyright © 2020 yeshuaNoriega. All rights reserved.
//

import Foundation

struct Claim : Codable {
    var id : UUID?
    var title : String
    var date : String
    var isSolved : Bool?
    
    init(this_title : String, this_date : String) {
        title = this_title
        date = this_date
    }
}

class ClaimService {
    
    var ClaimList: [Claim] = [Claim]()
    
    func addClaim(pObj : Claim) {
        let requestUrl = "http//localhost:8020/ClaimService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(pObj)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                let respStr = String(bytes: resp, encoding: .utf8)
                print("The response data sent from the server is \(respStr!)")
            } else if let respError = error {
                print("Server Error : \(respError)")
            }
        }
        task.resume()
    }
    
    func getAll(){
        print("About to send HTTP request to server")
        let requestUrl = "http://localhost:8020/ClaimService/getAll"
        let request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let respData = data {
                self.ClaimList = try! JSONDecoder().decode([Claim].self, from: respData)
                print("the Claim List : \(self.ClaimList)")
            }
        }
        task.resume()
    }
}
