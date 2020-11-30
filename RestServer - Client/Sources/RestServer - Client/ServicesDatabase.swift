//
//  ServicesDatabase.swift
//  RestServer - Client
//
//  Created by yeshua z noriega long on 11/24/20.
//

import SQLite3
import Foundation

class Database {
    static var dbObj : Database!
    let dbname = "/Users/yeshua/Documents/ClaimData.sqlite"
    var conn : OpaquePointer!
    
    init() {
        // CREATE DATABASE
        if sqlite3_open(dbname, &conn) == SQLITE_OK {
            // CREATE TABLE
            initializeDB()
            sqlite3_close(conn)
        } else {
            let errcode = sqlite3_errcode(conn)
            print("Open database failed due to error \(errcode)")
        }
    }
    
    // INIT TABLE "Claim" WITH FIELDS ("id", "title", "date", "isSolved")
    private func initializeDB() {
        let sqlStmt = "create table if not exists Claim (id text, title text, date text, isSolved integer)"
        if sqlite3_exec(conn, sqlStmt, nil, nil, nil) != SQLITE_OK {
            let errcode = sqlite3_errcode(conn)
            print("Create table failed due to error \(errcode)")
        }
    }
    
    
    func getDBConnection() -> OpaquePointer? {
        var conn : OpaquePointer?
        if sqlite3_open(dbname, &conn) == SQLITE_OK {
            return conn
        } else {
            let errcode = sqlite3_errcode(conn)
            let errmsg = sqlite3_errmsg(conn)
            print("Open database failed due to error\(errcode)")
            print("Open database failed due to error\(errmsg!)")
            let _ = String(format:"%@", errmsg!)
        }
        return conn
    }
    
    static func getInstance() -> Database {
        if dbObj == nil {
            dbObj = Database()
        }
        return dbObj
    }
}
