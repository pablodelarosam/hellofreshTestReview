//
//  LoginViewController.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/1/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController, ControllerType {
    typealias ViewModelType = LoginControllerViewModel
    
    // MARK: - Properties
    var viewModel: ViewModelType!
    let disposeBag = DisposeBag()
    
    // MARK: - UI
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    weak var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure(with: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Functions
    func configure(with viewModel: ViewModelType) {
         
         emailTextfield.rx.text.asObservable()
             .ignoreNil()
             .subscribe(viewModel.input.email)
             .disposed(by: disposeBag)
         
         passwordTextfield.rx.text.asObservable()
             .ignoreNil()
             .subscribe(viewModel.input.password)
             .disposed(by: disposeBag)
         
         signInButton.rx.tap.asObservable()
             .subscribe(viewModel.input.signInDidTap)
             .disposed(by: disposeBag)
         
         viewModel.output.errorsObservable
             .subscribe(onNext: { [unowned self] (error) in
                 let error = error as NSError
                 self.presentError(error)
                 
             })
             .disposed(by: disposeBag)
         
         viewModel.output.loginResultObservable
             .subscribe(onNext: { [unowned self] (user) in
                self.coordinator?.goToRecipesList(from: self)
             })
             .disposed(by: disposeBag)

     }
}

extension LoginViewController {
    static func create(with viewModel: ViewModelType) -> UIViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        controller.viewModel = viewModel
        return controller
    }
}
