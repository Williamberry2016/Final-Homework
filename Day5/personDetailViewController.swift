//
//  personDetailViewController.swift
//  Day5
//
//  Created by William Berry on 9/29/15.
//  Copyright © 2015 William Berry. All rights reserved.
//

import UIKit

class personDetailViewController: UIViewController, UITextFieldDelegate {

   
   // @IBOutlet weak var fnamelabel: UILabel!
    
   // @IBOutlet weak var lnamelabel: UILabel!
    var selectedName : Person?
    
//    @IBOutlet var selectedName: UIView!
    
    @IBOutlet weak var fnametextfield: UITextField!
    
    @IBOutlet weak var lNameTextField: UITextField!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fnametextfield.delegate = self
        lNameTextField.delegate = self
        
       // fnametextfield.text = selectedName?.firstName
        //lNameTextField.text = selectedName?.lastName
        
        
        
        
       //fnamelabel.text = selectedName?.firstName
        //lnamelabel.text = selectedName?.lastName
        // Do view setup here.
    }
    
    func textFieldShouldReturn(textField: UITextField) ->
        Bool {
    
            if let firstNameText = fnametextfield.text{
            selectedName?.firstName = firstNameText
            }
            if let lastNameText = lNameTextField.text{
                selectedName?.firstName = lastNameText
            }
            
            
    textField.resignFirstResponder()
    return true
    }
}
