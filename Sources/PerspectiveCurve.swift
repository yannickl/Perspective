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

import UIKit

/**
 The abstract timing function curve struct.

 The `PerspectiveCurve` defines the API to create custom timing function that specifies
 the speed over time of an object being animated from one value to another.
 */
public struct PerspectiveCurve {
  /**
   The timing function.

   - parameter time: The time of the animation between 0 and 1.
   - parameter depth: The depth of the perspective layer between 0 and 1.
   - returns: The speed of the animation between 0 and 1.
   */
  public typealias TimingFunction = (_ time: CGFloat, _ depth: CGFloat) -> CGFloat

  private let timingFunction: TimingFunction

  /**
   Initialize a `PerspectiveCurve` using a given timing function.

   - parameter timingFunction: The time function.
   */
  public init(timingFunction: @escaping TimingFunction) {
    self.timingFunction = timingFunction
  }

  internal func value(at time: CGFloat, depth: CGFloat) -> CGFloat {
    return timingFunction(time, depth)
  }
}
