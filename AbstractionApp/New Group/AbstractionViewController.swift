//
//  AbstractionViewController.swift
//  AbstractionApp
//
//  Created by Larson, David on 12/6/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class AbstractionViewController: UIPageViewController, UIPageViewControllerDataSource
{
    
    //Lifecycle methods
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedAbstractionViews.first
        {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
    }
        //ArrayList
        //Mark: - Data members
        private lazy var orderedAbstractionViews : [UIViewController] =
        {
            return [
                self.newAbstractionViewController(abstractionLevel: "Swift"),
                self.newAbstractionViewController(abstractionLevel: "Block"),
                self.newAbstractionViewController(abstractionLevel: "ByteCode"),
                self.newAbstractionViewController(abstractionLevel: "Binary"),
                self.newAbstractionViewController(abstractionLevel: "LogicalGate")
            ]
        }()
        
        //Helper method to retreive the correct ViewController based on the data member
        private func newAbstractionViewController(abstractionLevel : String) -> UIViewController
        {
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(abstractionLevel)ViewController")
        }
        
        //Swipe Left
        public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController:
            UIViewController) -> UIViewController?
        {
            guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
                else
            {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            guard previousIndex >= 0
                else
            {
                return orderedAbstractionViews.last
            }
            
            guard orderedAbstractionViews.count > previousIndex
                else
            {
                return nil
            }
            
            return orderedAbstractionViews[previousIndex]
        }
        
        //Swipe right
        public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController:
            UIViewController) -> UIViewController?
        {
            guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
                else
            {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            
            guard nextIndex < orderedAbstractionViews.count
                else
            {
                return orderedAbstractionViews.first
            }
            
            return orderedAbstractionViews[nextIndex]
        }
}
