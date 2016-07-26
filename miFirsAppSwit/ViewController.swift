//
//  ViewController.swift
//  miFirsAppSwit
//
//  Created by RENT ADVISOR on 3/05/16.
//  Copyright © 2016 RENT ADVISOR. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var btnRecuperarContraseña: UIButton!
    @IBOutlet var btnIngresar: UIButton!
    @IBOutlet var btnResgitrarse: UIButton!
    @IBOutlet var tfContraseña: UITextField!
    @IBOutlet var tfUsuario: UITextField!
    @IBOutlet var vwBox2: UIView!
    @IBOutlet var vwBox: UIView!
    @IBOutlet var lbTitle: UILabel!
    var validarCampos = false
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.backgroundColor = UIColor(patternImage:self.ResizeImage("registrarse.jpg",targetSize: size))
        tfContraseña.delegate = self
        tfUsuario.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewDidAppear(animated: Bool) {
//        UIView.animateWithDuration(0.7, delay: 0.5, options: .CurveEaseOut, animations: {
//            var basketTopFrame = self.vwBox.frame
//            basketTopFrame.origin.y = basketTopFrame.size.height
//            
//            var basketBottomFrame = self.vwBox.frame
//            basketBottomFrame.origin.y = basketBottomFrame.size.height
//            
//            self.vwBox.frame = basketTopFrame
//            self.vwBox.frame = basketBottomFrame
//            }, completion: { finished in
//                print("Basket doors opened!")
//        })
//    }
    
    
    @IBAction func btn2(sender: AnyObject) {
     
        
        UIView.animateWithDuration(0.3, delay: 0.3,
                                   options: .CurveEaseIn, animations: {
                                    self.vwBox2.center.x -= self.view.bounds.width
            }, completion: nil)

        
        self.vwBox.hidden = true
        let size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.backgroundColor = UIColor(patternImage:self.ResizeImage("Ingresar-fondo.png",targetSize: size))
              
       self.vwBox2.frame =  CGRectMake(self.vwBox.frame.origin.x, self.vwBox.frame.origin.y, self.vwBox.frame.size.width, self.vwBox.frame.size.height);
        //self.vwBox2.frame =  CGRectMake(100, 0, self.vwBox.frame.size.width, self.vwBox.frame.size.height);
        let altura = (self.vwBox.frame.size.height / 4 )
        
        tfUsuario.frame = CGRect(x: 0,  y: 0, width: self.vwBox2.frame.size.width, height: altura)
        tfContraseña.frame = CGRect(x: 0,  y: altura, width: self.vwBox2.frame.size.width, height: altura)
        btnIngresar.frame = CGRect(x: 0,  y: altura*2, width: self.vwBox2.frame.size.width, height: altura)
        btnResgitrarse.frame = CGRect(x: 0,  y: altura*3, width: self.vwBox2.frame.size.width/2, height: altura)
        btnRecuperarContraseña.frame = CGRect(x: self.vwBox2.frame.size.width/2,  y: altura*3, width: self.vwBox2.frame.size.width/2, height: altura)
            
        self.view.addSubview(self.vwBox2)
        
    }
    @IBAction func btnFacebook(sender: AnyObject) {
        
    }
    @IBAction func btnIngresar(sender: AnyObject) {
        
        //VALIDACION CAMPOS VACIOS
        
        validarCampos = true
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if (validarCampos) {
            if (tfContraseña.text!.isEmpty || tfUsuario.text!.isEmpty) {
                
                let alertController = UIAlertController(title: "CAMPOS VACIOS", message:
                    "Complete los campos!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                
                validarCampos = false
                return false
            }
        }
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        switch textField
        {
        case tfUsuario:
           tfContraseña.becomeFirstResponder()
            break
        case tfContraseña:
            view.endEditing(true)
            break
        default:
            break
        }
        return true
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "push1Registro" {
            print("entro COMUNICACION push1Registro");
            let controller = segue.destinationViewController as! RegistroController
            controller.sizeVW = CGRectMake(self.vwBox.frame.origin.x, self.vwBox.frame.origin.y, self.vwBox.frame.size.width, self.vwBox.frame.size.height);
        }
        if segue.identifier == "push2Registro" {
            print("entro COMUNICACION push2Registro");
            let controller = segue.destinationViewController as! RegistroController
            controller.sizeVW = CGRectMake(self.vwBox.frame.origin.x, self.vwBox.frame.origin.y, self.vwBox.frame.size.width, self.vwBox.frame.size.height);
        }

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

