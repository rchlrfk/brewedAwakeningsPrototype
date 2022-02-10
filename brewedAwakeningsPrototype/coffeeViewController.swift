//
//  coffeeViewController.swift
//  brewedAwakeningsPrototype
//
//  Created by Rachel Rafik on 1/31/22.
//

import UIKit

class coffeeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    //items
    @IBOutlet var images: [UIImageView]!
    
    @IBOutlet weak var tableView: UITableView!
    var items:[String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    // When the coffee image is pressed
    @IBAction func whenTapGesturePressed1(_ sender: UITapGestureRecognizer)
    {
        let selectedPoint = sender.location(in: view)
            for img in images
            {
                if img.frame.contains(selectedPoint)
                {
                    let newItem = "Coffee"
                    items.append(newItem)
                    tableView.reloadData()
                }
            }
    }
    
    // When the tea image is pressed
    @IBAction func whenTapGesturePressed2(_ sender: UITapGestureRecognizer)
    {
        let selectedPoint = sender.location(in: view)
            for img in images
            {
                if img.frame.contains(selectedPoint)
                {
                    let newItem = "Tea"
                    items.append(newItem)
                    tableView.reloadData()
                }
            }
    }
    
    // When the flavor image is pressed
    @IBAction func whenTapGesturePressed3(_ sender: UITapGestureRecognizer)
    {
        let selectedPoint = sender.location(in: view)
            for img in images
            {
                if img.frame.contains(selectedPoint)
                {
                    let newItem = "Flavor"
                    items.append(newItem)
                    tableView.reloadData()
                }
            }
    }
    
    // Add things to table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    // Delete things from table view
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }

}
