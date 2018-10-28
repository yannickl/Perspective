//
//  ViewController.swift
//  PerspectiveViewExample
//
//  Created by Yannick LORIOT on 27/10/2018.
//  Copyright © 2018 Yannick Loriot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var perspectiveView: PerspectiveView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let contentSize = CGSize(width: 1520, height: 812) // CGSize(width: 1600, height: 900) // CGSize(width: 1443, height: 812)

    for i in stride(from: 6, to: 0, by: -1) {
      let imgView = UIImageView(image: UIImage(named: "candy-layer0\(i)"))
      imgView.frame = CGRect(origin: .zero, size: CGSize(width: 1600, height: 900))

      let layer = PerspectiveSheet(view: imgView, distance: 0, offset: CGPoint(x: -40 * i, y: 0))
      perspectiveView.addLayer(layer)
    }

    let scrollBehavior = PerspectiveScrollBehavior()
    scrollBehavior.contentSize = contentSize
    perspectiveView.addBehavior(scrollBehavior)

    let motionBehavior = PerspectiveMotionBehabior()
    perspectiveView.addBehavior(motionBehavior)
  }
}

