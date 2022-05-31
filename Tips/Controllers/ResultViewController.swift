//
//  ResultViewController.swift
//  Tips
//
//  Created by MA SHAO I on 2022/3/3.
//

import UIKit

class ResultViewController: UIViewController {
    var totalTip: String!
    var tip: String!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var tipDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = totalTip
        tipDescription.text = tip
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculate(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
