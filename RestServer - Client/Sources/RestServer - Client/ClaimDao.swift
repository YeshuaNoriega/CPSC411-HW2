//
//  ClaimDao.swift
//  RestServer - Client
//
//  Created by yeshua z noriega long on 11/24/20.
//

import SQLite3
import Foundation

struct Claim : Codable {
    var id : UUID?
    var title : String
    var date : String
    var isSolved : Bool?
    
    init(this_id : UUID?, this_title : String, this_date : String, this_isSolved : Bool?) {
        id = this_id
        title = this_title
        date = this_date
        isSolved = this_isSolved
    }
    
    init( this_title : String, this_date : String) {
        title = this_title
        date = this_date
    }
}

class ClaimDao {
    
    func addClaim(pObj : Claim) {
        let sqlStmt = String(format: "insert into Claim (id, title, date, isSolved) values ('%@', '%@', '%@', '%@')", UUID().uuidString, (pObj.title), pObj.date, "0")
        
        // GET DATABASE CONNECTION
        let conn = Database.getInstance().getDBConnection()
        
        // SUBMIT THE INSERT SQL STATEMENT
        if sqlite3_exec(conn, sqlStmt, nil, nil, nil) != SQLITE_OK {
            let errcode = sqlite3_errcode(conn)
            print("Fialed to insert a Claim record due to error \(errcode)")
        }
        
        // CLOSE THE CONNECTION
        sqlite3_close(conn)
    }
    
    func getAll() -> [Claim] {
        var pList = [Claim]()
        var resultSet : OpaquePointer?
        let sqlStr = "select id, title, date, isSolved from Claim"
        let conn = Database.getInstance().getDBConnection()
        if sqlite3_prepare(conn, sqlStr, -1, &resultSet, nil) == SQLITE_OK {
            while (sqlite3_step(resultSet) == SQLITE_ROW) {
                // CONVERT THE RECORD INTO A CLAIM OBJECT
                // GET ID
                let id_val = sqlite3_column_text(resultSet, 0)
                let id = UUID(uuidString: String(cString: id_val!))
                
                // GET TITLE
                let title_val = sqlite3_column_text(resultSet, 1)
                let title = String(cString: title_val!)
                
                // GET DATE
                let date_val = sqlite3_column_text(resultSet, 2)
                let date = String(cString: date_val!)
                
                // GET ISSOLVED
                let isSolved_val = sqlite3_column_text(resultSet, 3)
                let isSolved = Bool(exactly: (Int(String(cString: isSolved_val!)))! as NSNumber)
                
                // CREATE CLAIM AND APPEND TO LIST 'pList'
                pList.append(Claim(
                        this_id: id,
                        this_title: title,
                        this_date: date,
                        this_isSolved: isSolved))
            }
        }
        return pList
    }
}
