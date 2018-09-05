//
//  ResetViewController.swift
//  FirebaseTutorial
//
//  Created by Yoga Pratama on 05/09/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetViewController: UIViewController {
    
    @IBOutlet weak var emailTextField  : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func resetPassFunc(_ sender : AnyObject){
        
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please Enter Email", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(alertAction)
            present(alertController , animated: true, completion:  nil)
        }else{
            Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) {
                error in
                if  error != nil {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(alertAction)
                    self.present(alertController , animated: true, completion:  nil)
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
