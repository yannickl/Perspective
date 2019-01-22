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
 A set of methods implemented by the delegate of a behaviour to handle updates.
 */
public protocol PerspectiveBehaviourDelegate: class {
  /**
   - parameter behaviour:
   - parameter offset:
   */
  func behaviour(_ behaviour: PerspectiveBehaviour, didUpdate offset: CGPoint)
}

/**
 The protocol that behaviours must adopt.
 */
public protocol PerspectiveBehaviour {
  /**
   A unique global identifier.
   */
  var identifier: String { get }
  /**
   */
  var offset: CGPoint { get }
  /**
   - parameter view:
   - parameter delegate:
   */
  func link(to view: UIView, delegate: PerspectiveBehaviourDelegate)
  /**
   */
  func unlink()
  /**
   - parameter bounds:
   - parameter contentSize:
   */
  func dimensionsDidUpdate(bounds: CGRect, contentSize: CGSize)
}
