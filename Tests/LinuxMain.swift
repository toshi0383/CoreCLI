import XCTest

import CoreCLITests

var tests = [XCTestCaseEntry]()
tests += CoreCLITests.allTests()
XCTMain(tests)