//
//  growerIndexController.swift
//  miFirsAppSwit
//
//  Created by RENT ADVISOR on 16/07/16.
//  Copyright © 2016 RENT ADVISOR. All rights reserved.
//

import UIKit

class growerIndexController: UIViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var pcSlider: UIPageControl!
    @IBOutlet var scSliderTopImagenes: UIScrollView!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5"]
    
    var imagenes:NSArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scSliderTopImagenes.pagingEnabled = true;
        scSliderTopImagenes.delegate = self
        //scSliderTopImagenes.frame = self.view.frame
        scSliderTopImagenes.frame = CGRect(x: 0,y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height / 2);
        imagenes = ["slide1.jpg","slide2.jpg","slide3.jpg","slide4.jpg"];
        pcSlider.numberOfPages = imagenes.count;
        //pcImagenes.frame = CGRectMake(00, 500, 100, 100)
        self.view.addSubview(pcSlider)
        
        
        self.loadGalery();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func scrollViewDidScroll(scrollView: UIScrollView){
        let current = scrollView.contentOffset.x / (self.scSliderTopImagenes.frame.size.width);
        pcSlider.currentPage = Int(current);
    }
    func loadGalery() -> Void {
        
        for i in 0 ..< imagenes.count {
            
            let imagen:UIImage = UIImage(named:imagenes.objectAtIndex(i) as! String)!;
            let imagenView:UIImageView = UIImageView(image: imagen);
            let x = CGFloat(i) * scSliderTopImagenes.frame.width;
            print("scrollView X ", x )
            imagenView.frame = CGRectMake(x, 0, scSliderTopImagenes.frame.size.width, scSliderTopImagenes.frame.size.height)
            scSliderTopImagenes.addSubview(imagenView)
        }
        
        let sizewidth = CGFloat(imagenes.count) ;
        scSliderTopImagenes.contentSize = CGSizeMake(sizewidth * scSliderTopImagenes.frame.width,0)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! colecionControllerCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

}
