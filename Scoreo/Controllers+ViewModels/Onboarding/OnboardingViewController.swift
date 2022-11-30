//
//  OnboardingViewController.swift
//  Core Score
//
//  Created by Remya on 9/30/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var current = 0
    var titles = ["Welcome to ScorePro".localized,"Football".localized,"Live Score Updates".localized,"Not Just Another App".localized]
    
    var descriptions = ["ScorePro is your one stop shop to your world of sports. Say goodbye to googling results and keeping tabs on your favourite teams and say hello to a world of infotainment all on your fingertips! ".localized,"Football events like you’ve never seen them before. From the leagues to the World Cup and everything in between, we have it covered".localized,"As it happens, because even a second too late is too late in our books. We take the match from the field and put it on your screen, so that you’re in the know as it happens".localized,"You deserve the best and your favourite team needs your support. We get you in to the action like never before. Wanna know how your team is going to perform? No problem!".localized]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()

        // Do any additional setup after loading the view.
    }
    
    func initialSettings(){
        collectionView.registerCell(identifier: "OnboardingCollectionViewCell")
        setupGestures()
        
    }
    
    func setupGestures(){
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
        left.direction = .left
        left.delegate = self
        collectionView.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
        right.direction = .right
        right.delegate = self
        collectionView.addGestureRecognizer(right)
        
    }
    
    func moveForward(){
        let total = titles.count
        if current < (total - 1){
            current += 1
            collectionView.scrollToItem(at: IndexPath(row: current, section: 0), at: .centeredHorizontally, animated: true)
        }
        else{
            Utility.gotoHome()
            Utility.callURlDetailsAPI()
        }
    }
    
    @objc func swipe(sender:UISwipeGestureRecognizer){
        
        if sender.direction == .left{
            moveForward()
        }
        else{
            if current > 0{
                current -= 1
                collectionView.scrollToItem(at: IndexPath(row: current, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
        
    }
}


extension OnboardingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        let img = UIImage(named: "onboarding\(indexPath.row+1)")!
        cell.pageControl.numberOfPages = titles.count
        cell.configureCell(title: titles[indexPath.row], description: descriptions[indexPath.row], image: img, index: indexPath.row)
        cell.callNext = {
            self.moveForward()
        }
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}


extension OnboardingViewController:UIGestureRecognizerDelegate{
    
}
