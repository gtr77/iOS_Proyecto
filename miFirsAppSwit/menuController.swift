//
//  menuController.swift
//  miFirsAppSwit
//
//  Created by RENT ADVISOR on 13/05/16.
//  Copyright © 2016 RENT ADVISOR. All rights reserved.
//

import UIKit

class menuController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var tableView: UITableView!
    let opcionesMenu = ["Tu perfil","¿Qué es Grower?", "Aliados", "Feedback", "Términos y condiciones"]
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        //self.view.backgroundColor = UIColor(patternImage:self.ResizeImage("fondomorado.png",targetSize: size))
        self.tableView.backgroundColor  = UIColor(patternImage:self.ResizeImage("fondomorado.png",targetSize: size))
        //tableView.tableFooterView = UIView(frame:CGRectZero)
        self.tableView.separatorColor = UIColor.whiteColor()
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGrayColor().CGColor
        border.frame = CGRect(x: 0, y: tableView.frame.size.height - width, width: tableView.frame.size.width, height: tableView.frame.size.height)
        
        border.borderWidth = width
        tableView.layer.addSublayer(border)
        tableView.layer.masksToBounds = true
        
        //self.tableView.frame.size.height = 200
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opcionesMenu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.clearColor()
        
        let row = indexPath.row
        cell.textLabel?.text = opcionesMenu[row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        
        print(opcionesMenu[row])
        
        switch (row){
        case 0:
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("gorwerIndex") as UIViewController
            self.presentViewController(viewController, animated: false, completion: nil)
        case 1:
            print("¿Qué es Grower?")
        case 2:
            print("Aliados")
        case 3:
            print("Feedback")
        case 4:
            print("Términos y condiciones")
        default:
            print("")
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func ResizeImage(nameImage:String, targetSize: CGSize) -> UIImage {
        
        let img: UIImage = UIImage (named: nameImage)!
        let size = img.size
        let newSize = CGSizeMake(size.width,  size.height)
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRectMake(0, 0, targetSize.width, targetSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        img.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }


}
