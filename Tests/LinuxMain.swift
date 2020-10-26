import XCTest

import whenTappedTests

var tests = [XCTestCaseEntry]()
tests += whenTappedTests.allTests()
XCTMain(tests)
