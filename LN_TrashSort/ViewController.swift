//
//  ViewController.swift
//  TrashSort
//
//  Created by Natalie Lim on 6/30/16.
//  Copyright © 2016 Natalie Lim. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var trashnameTextField: UITextField!
    @IBOutlet weak var trashtypePicker: UIPickerView!
    
    @IBAction func addButtonClick(sender: UIButton) {
        
        if trashnameTextField.text !=  nil{
            addIt()
        } else {
            print("Empty")
        }
    }
    
    var compost = [String]()
    var recycle = [String]()
    var other = [String]()
    var pickerDataSource = ["Compost", "Recycle", "Other"]
    var selectedTrashType:String = "compost"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.trashtypePicker.dataSource = self;
        self.trashtypePicker.delegate = self;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addIt(){
        
        if let trashName = trashnameTextField.text {
            switch selectedTrashType {
            case "compost":
                compost.append(trashName)
                print(compost)
            case "recycle":
                recycle.append(trashName)
                print(recycle)
            case "other":
                other.append(trashName)
                print(other)
            default:
                return
            }
            
            trashnameTextField.text = ""
        }
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            self.selectedTrashType = "compost"
        }
        else if(row == 1)
        {
            self.selectedTrashType = "recycle"
        }
        else
        {
            self.selectedTrashType = "other"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! DisplayTrashTableViewController
        destination.allTrash = [compost, recycle, other]
        
    }
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        return
    }
}

