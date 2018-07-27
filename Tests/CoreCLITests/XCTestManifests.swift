import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CoreCLITests.allTests),
    ]
}
#endif