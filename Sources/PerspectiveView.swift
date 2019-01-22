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
 A streamlined interface for creating a parallax effect with its subviews.

 Perspective views let you create parallax effects using behaviours and curves.
 */
final public class PerspectiveView: UIView {
  /**
   The size of the content view.

   The unit of size is points. The default size is `CGSize.zero`.
   */
  public var contentSize: CGSize = .zero {
    didSet { updateDimensions() }
  }

  /**
   The point at which the origin of the content view is offset from the origin of the scroll view.
   */
  public var contentOffset: CGPoint {
    return CGPoint(x: distance.width * offsetRatio.x, y: distance.height * offsetRatio.y)
  }

  /**
   The behaviours objects currently attached to the perspective.
   */
  public private(set) var behaviours: [PerspectiveBehaviour] = []

  /**
   The timing curve function used for the scrolling effect.

   The default perspective curve is `PerspectiveCurve.linear`.
   */
  public var curve: PerspectiveCurve = .linear

  /**
   The list of views arranged by the perspective view.
   */
  public var arrangedSubviews: [UIView] {
    return parallaxView.subviews
  }

  /// The view used to add the parallax sheets
  private let parallaxView = UIView()

  /// The list of sheets used to create the parallax effect.
  private var sheets: [PerspectiveSheet] = []

  private var distance: CGSize = CGSize(width: 1, height: 1)
  private var offsetRatio: CGPoint = .zero {
    didSet { layoutArrangedSubview(offsetRatio: offsetRatio) }
  }

  // MARK: - UIView Lifecycle

  public override init(frame: CGRect) {
    super.init(frame: frame)

    setupSubviews()
    updateDimensions()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    setupSubviews()
    updateDimensions()
  }

  public override func layoutSubviews() {
    super.layoutSubviews()

    updateDimensions()
  }

  // MARK: - Managing Arranged Subviews

  /**
   Adds a view to the end of the arrangedSubviews array.

   - parameter view: The view to be added to the array of views arranged by the perspective.
   */
  public func addArrangedSubview(_ view: UIView) {
    let layer = PerspectiveSheet(view: view)

    addSheet(layer)
  }

  /**
   Removes the provided view from the perspective's array of arranged subviews.

   The view is also removed from the view hierarchy.

   - parameter view: The view to be removed from the array of views arranged by the perspective.
   */
  public func removeArrangedSubview(_ view: UIView) {
    view.removeFromSuperview()
  }

  func addSheet(_ layer: PerspectiveSheet) {
    sheets.append(layer)

    layer.view.frame = CGRect(origin: layer.offset, size: layer.view.frame.size)

    parallaxView.addSubview(layer.view)
  }

  // MARK: - Managing Behaviours

  /**
   Attaches a behaviour to the perspective view.

   - parameter behaviour: The behaviour to be managed by the perspective.
   */
  public func addBehaviour(_ behaviour: PerspectiveBehaviour) {
    assert(
      behaviours.first(where: { $0.identifier == behaviour.identifier }) == nil,
      "A behavior with identifier \(behaviour.identifier) is already in use"
    )

    behaviours.append(behaviour)

    behaviour.link(to: self, delegate: self)
    behaviour.dimensionsDidUpdate(bounds: bounds, contentSize: contentSize)
  }

  /**
   Detaches a gesture recognizer from the perspective view.

   - parameter behaviour: The behaviour to be forgotten by the perspective.
   */
  public func removeBehaviour(_ behaviour: PerspectiveBehaviour) {
    behaviour.unlink()

    behaviours = behaviours.filter { $0.identifier != behaviour.identifier }
  }

  // MARK: - Private methods

  private func updateDimensions() {
    behaviours.forEach { $0.dimensionsDidUpdate(bounds: bounds, contentSize: contentSize) }

    distance = CGSize(
      width: max(contentSize.width - bounds.width, 1),
      height: max(contentSize.height - bounds.height, 1)
    )
  }

  private func setupSubviews() {
    addSubview(parallaxView)

    parallaxView.clipsToBounds = true
    parallaxView.translatesAutoresizingMaskIntoConstraints = false

    for v in [parallaxView] {
      v.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
      v.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
      v.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
      v.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
  }

  private func layoutArrangedSubview(offsetRatio: CGPoint) {
    let distributedDepthRatio = 1 / CGFloat(sheets.count - 1)

    for (i, sheet) in sheets.enumerated() {
      let depth = sheet.depth ?? distributedDepthRatio * CGFloat(i)

      let xValue = self.curve.value(at: offsetRatio.x, depth: depth)
      let yValue = self.curve.value(at: offsetRatio.y, depth: depth)

      var vf = sheet.view.frame

      vf.origin.x = sheet.offset.x + distance.width * xValue * -1
      vf.origin.y = sheet.offset.y + distance.height * yValue * -1

      sheet.view.frame = vf
    }
  }
}

// MARK: - PerspectiveBehaviour Delegate Extension

extension PerspectiveView: PerspectiveBehaviourDelegate {
  public func behaviour(_ behaviour: PerspectiveBehaviour, didUpdate offset: CGPoint) {
    let reducedOffset: CGPoint = behaviours.reduce(.zero) { acc, behaviour in
      return CGPoint(x: acc.x + behaviour.offset.x, y: acc.y + behaviour.offset.y)
    }

    offsetRatio = CGPoint(
      x: reducedOffset.x / distance.width,
      y: reducedOffset.y / distance.height
    )
  }
}
