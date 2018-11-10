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

class RootViewController: UITableViewController {
  struct Sample {
    let title: String
    let description: String
    let segueId: String
  }

  let samples = [
    Sample(title: "Scroll", description: "Sample with scroll behavior", segueId: "Scroll"),
    Sample(title: "Motion", description: "Sample with motion behavior", segueId: "Motion"),
    Sample(title: "Scroll & Motion", description: "Sample with scrol & motion behavior", segueId: "Scroll+Motion"),
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
