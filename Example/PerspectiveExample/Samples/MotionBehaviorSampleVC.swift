//
//  MotionBehaviorSampleVC.swift
//  PerspectiveExample
//
//  Created by Yannick LORIOT on 27/10/2018.
//  Copyright © 2018 Yannick Loriot. All rights reserved.
//

import UIKit

class MotionBehaviorSampleVC: UIViewController {
  @IBOutlet weak var perspectiveView: PerspectiveView!

  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "Motion behavior sample"

    let contentSize = CGSize(width: 1600, height: 900) // CGSize(width: 1443, height: 812)

    for i in stride(from: 6, to: 0, by: -1) {
      let imgView = UIImageView(image: UIImage(named: "candy-layer0\(i)"))
      imgView.frame = CGRect(origin: .zero, size: CGSize(width: 1600, height: 900))

      let sheet = PerspectiveSheet(view: imgView, builder: PerspectiveSheetBuilder { _ in
        //$0.offset = CGPoint(x: -300 - 40 * i, y: 0)
      })
      perspectiveView.addSheet(sheet)
    }
    
    let motionBehavior = PerspectiveMotionBehabior()
    perspectiveView.addBehavior(motionBehavior)
  }
}

