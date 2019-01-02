//
//  ViewController.swift
//  XMLparsingswiftday24
//
//  Created by Felix ITs 03 on 26/12/18.
//  Copyright © 2018 chaitali. All rights reserved.
//

import UIKit
//"http://www.w3schools.com/xml/plant_catalog.xml"

class ViewController: UIViewController,XMLParserDelegate,UITableViewDataSource,UITableViewDelegate{
    var plantArray = [String]()
    var str:String?
    fileprivate var saxparser:XMLParser?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return plantArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell(style:.default, reuseIdentifier: "cell")
        cell.textLabel?.text=plantArray[indexPath.row]
        return cell
        
    }
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let str="https://www.w3schools.com/xml/plant_catalog.xml"
        let url=URL(string: str)
        saxparser=XMLParser(contentsOf: url!)
        saxparser?.delegate = self as XMLParserDelegate
        saxparser?.parse()
        print(plantArray)
        tableview.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        str=String()
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        str?.append(string)
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        plantArray.append(str!)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

