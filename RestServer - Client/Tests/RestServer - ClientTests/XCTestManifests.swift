import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RestServer___ClientTests.allTests),
    ]
}
#endif
