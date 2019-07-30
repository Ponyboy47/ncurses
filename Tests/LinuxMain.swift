import XCTest

import NCursesTests

var tests = [XCTestCaseEntry]()
tests += NCursesTests.allTests()
XCTMain(tests)
