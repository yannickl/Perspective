//
//  ScrollBehaviorSampleVC.swift
//  PerspectiveExample
//
//  Created by Yannick LORIOT on 27/10/2018.
//  Copyright © 2018 Yannick Loriot. All rights reserved.
//

import UIKit

class ScrollBehaviorSampleVC: UIViewController {
  @IBOutlet weak var perspectiveView: PerspectiveView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "Scroll behavior sample"
    
    let contentSize = CGSize(width: 1600, height: 900) // CGSize(width: 1443, height: 812)

    for i in stride(from: 7, to: 0, by: -1) {
      let imgView = UIImageView(image: UIImage(named: "castle-layer0\(i)"))
      imgView.frame = CGRect(origin: .zero, size: CGSize(width: 1600, height: 900))

      let sheet = PerspectiveSheet(view: imgView, builder: PerspectiveSheetBuilder { _ in
        //$0.offset = CGPoint(x: -300 - 40 * i, y: 0)
      })
      perspectiveView.addSheet(sheet)
    }

    let scrollBehavior = PerspectiveScrollBehavior()
    scrollBehavior.contentSize = contentSize
    perspectiveView.addBehavior(scrollBehavior)
  }
}

