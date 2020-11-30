import Kitura
import Cocoa

let router = Router()

router.all("/ClaimService/add", middleware: BodyParser())

router.get("/") {
    request, response, next in
    response.send("Hello! Welcome to the claim service.")
    next()
}

router.get("ClaimService/getAll"){
    request, response, next in
    let pList = ClaimDao().getAll()
    // JSON SERIALIZATION
    let jsonData : Data = try JSONEncoder().encode(pList)
    
    // JSONArray
    let jsonStr = String(data: jsonData, encoding: .utf8)
    
    // SET CONTENT-TYPE
    response.status(.OK)
    response.headers["Content-Type"] = "application/json"
    response.send(jsonStr)
    next()
}

router.post("ClaimService/add") {
    request, response, next in
    // JSON DESERIALIZATION ON KITURA SERVER
    let body = request.body
    let jObj = body?.asJSON // JSON OBJECT
    
    if let jDict = jObj as? [String:String] {
        if let title = jDict["title"], let date = jDict["date"] {
            let pObj = Claim(this_title: title, this_date: date)
            ClaimDao().addClaim(pObj: pObj)
            response.send("The Claim record was successfully inserted (via POST method).")
        }
    }
    next()
}

Kitura.addHTTPServer(onPort: 8020, with: router)
Kitura.run()
