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

import Foundation
import UIKit

/**
 The scroll behaviour.

 Uses a `UIScrollView` to update the offset of the perspective views through user
 touch interaction.
 */
final public class PerspectiveScrollBehaviour: NSObject, PerspectiveBehaviour {
  private let scrollView = UIScrollView()
  private weak var delegate: PerspectiveBehaviourDelegate?

  public let identifier = "ScrollBehavior"

  /**
   The size of the content view.

   The unit of size is points. The default size is CGSizeZero.
   */
  public var bounces: Bool {
    get { return scrollView.bounces }
    set { scrollView.bounces = newValue }
  }

  public var offset: CGPoint {
    get { return scrollView.contentOffset }
    set {}
  }

  /**
   The behavior for determining the adjusted content offsets.

   This property specifies how the safe area insets are used to modify
   the content area of the scroll view. The default value of this property is `UIScrollView.ContentInsetAdjustmentBehavior.never`.
   */
  public var contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior {
    get { return scrollView.contentInsetAdjustmentBehavior }
    set { scrollView.contentInsetAdjustmentBehavior = newValue }
  }

  public func link(to view: UIView, delegate: PerspectiveBehaviourDelegate) {
    view.addSubview(scrollView)

    self.delegate = delegate
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false
    self.scrollView.contentInsetAdjustmentBehavior = .never

    self.scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    self.scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    self.scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

    self.scrollView.delegate = self
    self.scrollView.showsVerticalScrollIndicator = false
    self.scrollView.showsHorizontalScrollIndicator = false
  }

  public func unlink() {
    delegate = nil
    scrollView.removeFromSuperview()
  }

  public func dimensionsDidUpdate(bounds: CGRect, contentSize: CGSize) {
    scrollView.contentSize = CGSize(
      width: max(bounds.width, contentSize.width),
      height: max(bounds.height, contentSize.height)
    )
  }
}

extension PerspectiveScrollBehaviour: UIScrollViewDelegate {
  public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    delegate?.behaviour(self, didUpdate: scrollView.contentOffset)
  }
}
