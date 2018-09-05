//
//  SignUpViewController.swift
//  FirebaseTutorial
//
//  Created by Yoga Pratama on 05/09/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction  func signUpUser(_ sender: AnyObject){
        if emailTextField.text ==  ""  || passwordTextField.text ==  ""{
            let alertController = UIAlertController(title: "Error", message: "Please Enter Email and Password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated:  true , completion:  nil)
            
        }else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) {
             (authResult , error) in
                if  error == nil{
                    print("sign up success check firabase console")
                    
                  let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginViewID")
                  self.present(vc!, animated:  true ,completion:  nil)
                    
                }else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
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
