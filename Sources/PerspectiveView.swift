/*
 * PerspectiveView
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

final public class PerspectiveView: UIView {
  private let parallaxView = UIView()

  public var movementCoordinator: PerspectiveMovementCoordinator = PerspectiveParallaxCoordinator()

  /**
   The list of sheets used to create the parallax effect.
   */
  private var sheets: [PerspectiveSheet] = []

  /**
   The gesture-recognizer objects currently attached to the view.
   */
  public private(set) var behaviors: [PerspectiveBehavior] = []

  public override init(frame: CGRect) {
    super.init(frame: frame)

    setupSubviews()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    setupSubviews()
  }

  private func setupSubviews() {
    addSubview(parallaxView)

    parallaxView.translatesAutoresizingMaskIntoConstraints = false

    for v in [parallaxView] {
      v.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
      v.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
      v.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
      v.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
  }

  /**
   Adds a view to the end of the stackedSubviews array.
   */
  public func addStackedSubview(_ view: UIView) {
    let layer = PerspectiveSheet(view: view, distance: nil, offset: .zero)

    addLayer(layer)
  }

  public func addLayer(_ layer: PerspectiveSheet) {
    sheets.append(layer)

    layer.view.frame = CGRect(origin: layer.offset, size: layer.view.frame.size)
    
    parallaxView.addSubview(layer.view)
  }

  /**
   Attaches a gesture recognizer to the view.
 */
  public func addBehavior(_ behavior: PerspectiveBehavior) {
    behaviors.append(behavior)

    behavior.setup(with: self)
  }
}

extension PerspectiveView: PerspectiveBehaviorDelegate {
  public func behavior(_ behavior: PerspectiveBehavior, didUpdate offset: CGPoint) {
    let offset: CGPoint = behaviors.reduce(.zero) { acc, behavior in
      return CGPoint(x: acc.x + behavior.offset.x, y: acc.y + behavior.offset.y)
    }

    movementCoordinator.updatePosition(of: sheets, offset: offset)
  }
}
