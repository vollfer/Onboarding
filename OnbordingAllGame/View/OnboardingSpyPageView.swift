//
//  OnboardingContactPageView.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 04.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//

import UIKit

protocol OnboardingContactPageViewOutput: ViewOutput {
   func didTapNextButton(isLastView: Bool)
}

class OnboardingContactPageView: UIPageViewController {
    
    var presenter: OnboardingContactPageViewOutput?
    var guideViewControllers: [UIViewController] = [] {
        didSet {
            guard let initialView = guideViewControllers.first else { return }
            pageControl.numberOfPages = guideViewControllers.count
            pageControl.currentPage = 0
            setViewControllers([initialView], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private var currentIndex: Int = 0
    private let pageControl: UIPageControl = {
        var pageControl = UIPageControl()
        pageControl.backgroundColor = .clear
        pageControl.isUserInteractionEnabled = false
        pageControl.hidesForSinglePage = true
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    }()
        
        
        
    // MARK: - Life cycle
        
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
            
        drawSelf()
    }
               
               
               
    // MARK: - Draw self
               
    private func drawSelf() {
      
        view.systemBackground()
        
        guard guideViewControllers.count != 0, guideViewControllers.count != 1 else { return }
        
        
        view.addSubview(pageControl)
        
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                pageControl.currentPageIndicatorTintColor = .red
            } else {
                pageControl.currentPageIndicatorTintColor = .systemBlue
                pageControl.pageIndicatorTintColor = .gray
            }
        } else {
            pageControl.currentPageIndicatorTintColor = .red
        }
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 125)
        ])
        
    }
}


// MARK: - UIPageViewControllerDataSource
extension OnboardingContactPageView: UIPageViewControllerDataSource {
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let previousIndex = guideViewControllers.firstIndex(of: viewController)  else { return nil }
            
            return guideViewControllers[safe: previousIndex - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let nextIndex = guideViewControllers.firstIndex(of: viewController) else { return nil }
            
            return guideViewControllers[safe: nextIndex + 1]
        }
        
        
    }


    // MARK: - UIPageViewControllerDelegate
    extension OnboardingContactPageView: UIPageViewControllerDelegate {
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
                
                guard let firstView = viewControllers?.first,
                    let newIndex = guideViewControllers.firstIndex(of: firstView) else { return }
                
                currentIndex = newIndex
                pageControl.currentPage = newIndex
            }
        }


extension OnboardingContactPageView: OnboardingContactPageViewInput {
    
    func scrollToNext() {
        
        let newIndex = currentIndex + 1
        
        guard let nextView = guideViewControllers[safe: newIndex] else { return }
        
        currentIndex = newIndex
        pageControl.currentPage = newIndex
        
        setViewControllers([nextView], direction: .forward, animated: true, completion: nil)
    }
}

extension OnboardingContactPageView: OnboardingContactModuleOutput {
   
    func nexxtActiv(from type: GAMETYPE) {
        let isLastView = guideViewControllers[safe: currentIndex + 1] == nil
        presenter?.didTapNextButton(isLastView: isLastView)
    }
    
}
