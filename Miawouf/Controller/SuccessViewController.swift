//
//  SuccessViewController.swift
//  Miawouf
//
//  Created by Sam on 10/06/2022.
//

import UIKit

class SuccessViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    var dog: Pet!

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTextLabel()
    }

    private func setTextLabel() {
        if let name = dog.name {
            label.text = """
            🎉 Wouf de bienvenue à  \(name) ! 🎉
            Vous avez bien été ajouté à  notre base de donnée ! Nous vous enverrons un SMS dès que nous avons une âme soeur à  vous proposer ! 🧐
            """
        }
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
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
