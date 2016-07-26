//
//  GaleriaController.swift
//  miFirsAppSwit
//
//  Created by RENT ADVISOR on 11/05/16.
//  Copyright © 2016 RENT ADVISOR. All rights reserved.
//

import UIKit

class GaleriaController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var pcImagenes: UIPageControl!
    //@IBOutlet var pcImagenes: UIPageControl! = UIPageControl(frame: CGRectMake(50, 300, 200, 50))

    @IBOutlet var scrollView: UIScrollView!
    var imagenes:NSArray = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.pagingEnabled = true;
        scrollView.delegate = self
        scrollView.frame = self.view.frame
        imagenes = ["slide1.jpg","slide2.jpg","slide3.jpg","slide4.jpg"];
        pcImagenes.numberOfPages = imagenes.count;
        //pcImagenes.frame = CGRectMake(00, 500, 100, 100)
        self.view.addSubview(pcImagenes)
       
        self.loadGalery();
    }

    func loadGalery() -> Void {
        
        for i in 0 ..< imagenes.count {
            
            let imagen:UIImage = UIImage(named:imagenes.objectAtIndex(i) as! String)!;
            let imagenView:UIImageView = UIImageView(image: imagen);
            let x = CGFloat(i) * scrollView.frame.width;
            print("scrollView X ", x )
            imagenView.frame = CGRectMake(x, 0, scrollView.frame.size.width, scrollView.frame.size.height)
            scrollView.addSubview(imagenView)
            
            if(i == 0){
                
                let y = imagenView.frame.size.height / 2;
                let xx = imagenView.frame.size.width * 0.2;
                
                // BUTON CAMARA
                
                let buttonCamera = UIButton(type: UIButtonType.System) as UIButton
                buttonCamera.frame = CGRectMake(xx, (y*0.20), 200, 150)
                buttonCamera.addTarget(self, action: #selector(buttonCamara), forControlEvents: UIControlEvents.TouchUpInside)
                scrollView.addSubview(buttonCamera)
                
                // BUTON MEET-UPS
                
                let buttonMeetUps = UIButton(type: UIButtonType.System) as UIButton
                buttonMeetUps.frame = CGRectMake(xx, y+(y*0.20), 200, 150)
                buttonMeetUps.addTarget(self, action: #selector(buttonMeetups), forControlEvents: UIControlEvents.TouchUpInside)
                scrollView.addSubview(buttonMeetUps)
                
            }
        }
        
        let sizewidth = CGFloat(imagenes.count) ;
         scrollView.contentSize = CGSizeMake(sizewidth * scrollView.frame.width,0)
    }
    
    func buttonCamara(sender:UIButton!)
    {
        print("Presiono Boton de Cammara")
    }
    func buttonMeetups(sender:UIButton!)
    {
        print("Presiono Boton de MeetUps")
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("menuController") as UIViewController
        self.presentViewController(viewController, animated: false, completion: nil)
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView){
        let current = scrollView.contentOffset.x / (self.scrollView.frame.size.width);
        pcImagenes.currentPage = Int(current);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
