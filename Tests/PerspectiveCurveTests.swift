/*
 * Perspective
 *
 * Copyright 2018-present Yannick Loriot.
 * http://yannickloriot.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

import XCTest
@testable import Perspective

class PerspectiveCurveTests: XCTestCase {
  override func setUp() {}
  override func tearDown() {}

  func testLinearCurves() {
    let linear = PerspectiveCurve.linear

    // Timing function with a depth of 0
    XCTAssertEqual(linear.value(at: 0, depth: 0), 0)
    XCTAssertEqual(linear.value(at: 0.5, depth: 0), 0.5)
    XCTAssertEqual(linear.value(at: 1, depth: 0), 1)

    // Timing function with a depth of 0.2
    XCTAssertEqual(linear.value(at: 0, depth: 0.2), 0)
    XCTAssertEqual(linear.value(at: 0.2, depth: 0.2), 0.16, accuracy: 0.001)
    XCTAssertEqual(linear.value(at: 1, depth: 0.2), 0.8)

    // Timing function with a depth of 1
    XCTAssertEqual(linear.value(at: 0, depth: 1), 0)
    XCTAssertEqual(linear.value(at: 0.5, depth: 1), 0)
    XCTAssertEqual(linear.value(at: 1, depth: 1), 0)
  }

  func testeaseInOutQuadCurves() {
    let easeInOutQuad = PerspectiveCurve.easeInOutQuad

    // Timing function with a depth of 0
    XCTAssertEqual(easeInOutQuad.value(at: 0, depth: 0), 0)
    XCTAssertEqual(easeInOutQuad.value(at: 0.5, depth: 0), 0.5)
    XCTAssertEqual(easeInOutQuad.value(at: 1, depth: 0), 1)

    // Timing function with a depth of 0.2
    XCTAssertEqual(easeInOutQuad.value(at: 0, depth: 0.2), 0)
    XCTAssertEqual(easeInOutQuad.value(at: 0.5, depth: 0.2), 0.4)
    XCTAssertEqual(easeInOutQuad.value(at: 1, depth: 0.2), 0.8)

    // Timing function with a depth of 1
    XCTAssertEqual(easeInOutQuad.value(at: 0, depth: 1), 0)
    XCTAssertEqual(easeInOutQuad.value(at: 0.5, depth: 1), 0)
    XCTAssertEqual(easeInOutQuad.value(at: 1, depth: 1), 0)
  }
}
