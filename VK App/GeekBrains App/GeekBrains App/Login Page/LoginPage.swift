//
//  ViewController.swift
//  GeekBrains App
//
//  Created by Sanzhar on 22.01.2021.
//

import UIKit

class LoginPage: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var centralVerticalConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFormView()
        setupSignInButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.view.addGestureRecognizer(tap)
    }
    
    func setupSignInButton() {
        signInButton.layer.cornerRadius = signInButton.frame.width / 2
    }
    
    func setupFormView() {
        formView.layer.cornerRadius = 15
    }
    
    @objc func keyboardWillAppear(_ notification: Notification?) {
        if let keyboardFrame: NSValue = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            raiseFormView(to: keyboardHeight)
        }
    }
    
    func raiseFormView(to height: CGFloat) {
        let formMaxY = formView.frame.maxY
        let currentViewHeight = self.view.frame.height - height
        let moveDistance = formMaxY - currentViewHeight + 35
        UIView.animate(withDuration: 0.3) {
            self.centralVerticalConstraint.constant = -moveDistance
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillDisappear(_ notification: Notification?) {
        UIView.animate(withDuration: 0.3) {
            self.centralVerticalConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func tapAction() {
        view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    let adminUsername = "Sanzhar"
    let adminPassword = "123"
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if loginParser() {
            return true
        }
        let alertController = UIAlertController(title: "Ошибка!", message: "Не правильный логин или пароль!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ок", style: .default) { (alert) in
            self.username.text = ""
            self.password.text = ""
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
        return false
    }
    
    func loginParser() -> Bool {
        return username.text == adminUsername && password.text == adminPassword
    }
}

