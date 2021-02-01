//
//  ViewController.swift
//  SampleViewControllerApp
//
//  Created by 栗須星舞 on 2021/01/02.
//

import UIKit

class ViewController: UIViewController {
    
    lazy private var currentViewController: UIViewController = viewControllers[0]
    lazy private var viewControllers: [UIViewController] = [
        storyboard?.instantiateViewController(withIdentifier: "Sample1ViewController") as! Sample1ViewController,
        storyboard?.instantiateViewController(withIdentifier: "Sample2ViewController") as! Sample2ViewController,
        storyboard?.instantiateViewController(withIdentifier: "Sample3ViewController") as! Sample3ViewController
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        add(viewController: currentViewController)
    }
    
    @IBAction func controller1ButtonDidTapped(_ sender: Any) {
        remove(viewController: currentViewController)
        add(viewController: viewControllers[0])
        currentViewController = viewControllers[0]
    }
    
    @IBAction func controller2ButtonDidTapped(_ sender: Any) {
        remove(viewController: currentViewController)
        add(viewController: viewControllers[1])
        currentViewController = viewControllers[1]
    }
    
    @IBAction func controller3ButtonDidTapped(_ sender: Any) {
        remove(viewController: currentViewController)
        add(viewController: viewControllers[2])
        currentViewController = viewControllers[2]
    }
    
    private func add(viewController: UIViewController) {
        //子ビューコントローラーの追加
        self.addChild(viewController)
        //子ビューコントローラーのViewを追加
        self.view.addSubview(viewController.view)
        //子ビューの設定
        viewController.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 80)
        //子ビューコントローラへの通知
        viewController.didMove(toParent: self)
    }
    
    private func remove(viewController: UIViewController) {
        //子ビューコントローラーへの通知
        viewController.willMove(toParent: nil)
        //子ビューを親ビューから削除
        viewController.view.removeFromSuperview()
        //子ビューコントローラーへの通知
        viewController.removeFromParent()
    }
}
