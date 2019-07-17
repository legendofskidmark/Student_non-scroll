//
//  ViewController.swift
//  Student
//
//  Created by Boon on 16/07/19.
//  Copyright © 2019 Boon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK:- Variables
    var dataModelArray:[StudentDataModel] = []
    
    //MARK:- IBOutlets
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldSection: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var textFieldPh: UITextField!
    
    //MARK:- IBAction
    @IBAction func submitPressed(_ sender: Any) {
        userEnteredData()
        textFieldName.text = ""
        textFieldSection.text = ""
        textFieldAge.text = ""
        textFieldPh.text = ""
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    //MARK:- App lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickedSomewhere))
        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(clickedSomewhere))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        
        textFieldName.inputAccessoryView = toolBar
        textFieldSection.inputAccessoryView = toolBar
        textFieldAge.inputAccessoryView = toolBar
        textFieldPh.inputAccessoryView = toolBar
      }
    
    override func viewWillAppear(_ animated: Bool) {
        print("1st view will appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("1st View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("1st View did disappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("1st View did appear")
    }
    
    //MARK:- private methods
    private func userEnteredData() {
        let name:String = textFieldName.text ?? "No name"
        let section:String = textFieldSection.text ?? "No section"
        let age:Int = Int(textFieldAge.text!) ?? 404
        let phone:Int = Int(textFieldPh.text!) ?? 500
        
        let dataModel = StudentDataModel(nameVal: name, sectionVal: section, ageVal: age, phoneVal: phone)
        
        dataModelArray.append(dataModel)
        print("54 VC", dataModelArray)
    }

    //MARK:- public functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.studentDataArray = dataModelArray
//            destinationVC.delegate = self
        }
    }
    
    func fetchData() {
        print("60")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField{
            case textFieldName:
                textFieldSection.becomeFirstResponder()
            case textFieldSection:
                textFieldAge.becomeFirstResponder()
            case textFieldAge:
                textFieldPh.becomeFirstResponder()
            case textFieldPh:
                textFieldPh.resignFirstResponder()
            default:
                print("Hit default case")
            }
        return true
    }
 
    @objc func clickedSomewhere(){
        self.view.endEditing(true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
