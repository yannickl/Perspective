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
 The ease timing curves.
 */
extension PerspectiveCurve {
  public static let easeInOutQuad: PerspectiveCurve = .easeInOut(2)
  public static let easeInOutCubic: PerspectiveCurve = .easeInOut(3)
  public static let easeInOutQuart: PerspectiveCurve = .easeInOut(4)

  public static let easeInOut = { (slope: CGFloat) in
    return PerspectiveCurve { (time, depth) -> CGFloat in
      let sigmoid = { (t: CGFloat, alpha: CGFloat) -> CGFloat in
        1 / (1 + pow(time / max(1 - time, 0.00000001), -alpha))
      }

      return sigmoid(time, slope) * (1 - depth)
    }
  }
}
