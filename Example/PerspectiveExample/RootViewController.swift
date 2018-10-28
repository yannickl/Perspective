//
//  RootViewController.swift
//  PerspectiveExample
//
//  Created by Yannick LORIOT on 28/10/2018.
//  Copyright © 2018 Yannick Loriot. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
  struct Sample {
    let title: String
    let description: String
    let segueId: String
  }

  let samples = [
    Sample(title: "Scroll", description: "Sample with scroll behavior", segueId: "Scroll"),
    Sample(title: "Motion", description: "Sample with motion behavior", segueId: "Motion"),
    Sample(title: "", description: "", segueId: "Scroll"),
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "Sample List"
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return samples.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath)

    cell.textLabel?.text = samples[indexPath.row].title
    cell.detailTextLabel?.text = samples[indexPath.row].description

    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: samples[indexPath.row].segueId, sender: self)
  }
}
