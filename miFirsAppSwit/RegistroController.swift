//
//  RegistroController.swift
//  miFirsAppSwit
//
//  Created by RENT ADVISOR on 12/05/16.
//  Copyright © 2016 RENT ADVISOR. All rights reserved.
//

import UIKit

class RegistroController: UIViewController, UITextFieldDelegate{

    @IBOutlet var vbBoxRegistro: UIView!
    @IBOutlet var tfcheckContraseña: UITextField!
    @IBOutlet var tfpasswordRegistro: UITextField!
    @IBOutlet var btnRegistrarse: UIButton!
    @IBOutlet var tfUsuarioRegistro: UITextField!
  
    var sizeVW: CGRect = CGRectMake(100, 100, 100, 100)
    var ttt = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.backgroundColor = UIColor(patternImage:self.ResizeImage("registrarse.jpg",targetSize: size))
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RegistroController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RegistroController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        tfcheckContraseña.delegate = self
        tfpasswordRegistro.delegate = self
        tfUsuarioRegistro.delegate = self
        
        vbBoxRegistro.frame = sizeVW
        let altura = (self.vbBoxRegistro.frame.size.height / 4 )
        
        UIView.animateWithDuration(0.5, delay: 0.4, options: [], animations: {
            self.vbBoxRegistro.center.x += self.view.bounds.width
            
            }, completion: nil)
      
        
         tfUsuarioRegistro.frame = CGRect(x: 0,  y:0 , width: self.vbBoxRegistro.frame.size.width, height: altura)
        tfpasswordRegistro.frame = CGRect(x: 0,  y: altura, width: self.vbBoxRegistro.frame.size.width, height: altura)
        tfcheckContraseña.frame = CGRect(x: 0,  y: altura*2, width: self.vbBoxRegistro.frame.size.width, height: altura)
        btnRegistrarse.frame = CGRect(x: 0,  y: altura*3, width: self.vbBoxRegistro.frame.size.width, height: altura)

    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnRegistro(sender: AnyObject) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func botonEnviar(sender: UIButton) {
    }
    
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

    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        switch textField
        {
        case tfUsuarioRegistro:
            print("Entro, el valor es:")
            
            tfpasswordRegistro.becomeFirstResponder()
            break
        case tfpasswordRegistro:
            tfcheckContraseña.becomeFirstResponder()
            break
        case tfcheckContraseña:
            view.endEditing(true)
            break
        default:
            break
        }
        return true
    }
 
    
    // Accion para que el key-board se oculte
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
            else {
                
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
            else {
                
            }
        }
    }

}
