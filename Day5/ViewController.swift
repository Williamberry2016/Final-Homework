//
//  ViewController.swift
//  Day5
//
//  Created by William Berry on 9/29/15.
//  Copyright © 2015 William Berry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        
        if let peopleFromArchive = self.loadFromArchive() {
            people = peopleFromArchive
            
        }else{
            let brad = Person(fName: "Brad", lName: "Johnson")
            
            let russ = Person(fName: "Russell", lName: "Wilson")
            
            people.append(brad)
            people.append(russ)
            for person in people {
                person.image = UIImage(named: "...")
            }
            
            saveToArchive()
            
        }
    }
    
  //  for var i = 0; i < people.count; i++ {
  //  let person = people[i]
    
    
  //  }
   
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    saveToArchive()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender:AnyObject?){
        
        //makes sure app doesn't crash if segue to a different page
        if segue.identifier == "ShowPersonDetail" {
            
            if let destinationViewController = segue.destinationViewController as? personDetailViewController
            {
            
            //identify name clicked on
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
            let selectedRow = selectedIndexPath.row
            let selectedName = people[selectedRow]
            
            
            destinationViewController.selectedName = selectedName
            destinationViewController.view.backgroundColor = UIColor.orangeColor()
        }
            }
        
        } else if segue.identifier == "MyOtherSegue"{
        }
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        
        
        let person = people[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as! PersonTableViewCell
        
        cell.personImageView.image = person.image
        
        cell.fnamelabel.text = person.firstName
        cell.lnameLabel.text = person.lastName
        cell.personImageView.image = person.image
        
        //cell.textLabel?.text = "\(person.firstName) \(person.lastName)"
        
        cell.textLabel?.text = person.firstName + " " + person.lastName
        
        return cell
    
    }
    
    func saveToArchive() {
        let documentPath = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last
        
        NSKeyedArchiver.archiveRootObject(people, toFile: documentPath! + "/archive")
    }



func loadFromArchive() -> [Person]? {
    if let documentPath = NSSearchPathForDirectoriesInDomains(
        NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last{
            if let people = NSKeyedUnarchiver.unarchiveObjectWithFile(documentPath) as? [Person]
            
            { return people
            }
            };return nil
    }

}




