//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Pankaj Manghnani on 9/21/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FiltersViewControllerDelegate {
    optional func filtersViewController (filtersViewController:FiltersViewController, didUpdateFilters filters:[String:AnyObject])
}

class FiltersViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,SwitchCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var categories:[[String:String]]!
    var switchStates=[Int:Bool]()
    weak var delegate: FiltersViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        categories=yelpCategories()
        tableView.delegate=self
        tableView.dataSource=self

        // Do any additional setup after loading the view.
    }

    
    @IBAction func onSearchView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        var filters=[String:AnyObject]()
        var selectedCategories=[String]()
        for(row,isSelected) in switchStates {
        
            if(isSelected)
            {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
        if(selectedCategories.count>0)
        {
          filters["categories"] = selectedCategories
        }
        delegate?.filtersViewController?(self,didUpdateFilters: filters)

    }
    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       
            return  categories.count
       
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("SwitchCell",forIndexPath:indexPath) as! SwitchCell
        cell.switchLabel.text=categories[indexPath.row]["name"]
        cell.delegate=self
        cell.onSwitch.on = switchStates[indexPath.row] ?? false

        return cell;
    }
    
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        let indexPath=tableView.indexPathForCell(switchCell)!
        switchStates[indexPath.row]=value
        
    }
    
    func yelpCategories() -> [[String:String]]{
    return [["name":"Afghan","code":"afghani"],
        ["name":"African","code":"african"],
        ["name":"American, new","code":"newamerican"],
        ["name":"Indian","code":"indpak"],
        ["name":"Thai","code":"thai"]]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
