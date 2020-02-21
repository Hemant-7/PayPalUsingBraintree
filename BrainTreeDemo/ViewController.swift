//
//  ViewController.swift
//  BrainTreeDemo
//
//  Created by Brain Tech on 2/19/20.
//  Copyright © 2020 Brain Tech. All rights reserved.
//

import UIKit
import BraintreeDropIn
import Braintree

class ViewController: UIViewController,BTAppSwitchDelegate,BTViewControllerPresentingDelegate {
    
    @IBOutlet var btnPay: UIButton!
    var braintreeClient: BTAPIClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        braintreeClient = BTAPIClient(authorization: "Tokenization Keys")!
        self.startCheckout()
        // Do any additional setup after loading the view.
    }
    
    func startCheckout() {
        braintreeClient = BTAPIClient(authorization: "Tokenization Keys")!
        let payPalDriver = BTPayPalDriver(apiClient: braintreeClient!)
        payPalDriver.viewControllerPresentingDelegate = self
        payPalDriver.appSwitchDelegate = self // Optional
        
        let request = BTPayPalRequest()
        request.billingAgreementDescription = "Your agremeent description" //Displayed in customer's PayPal account
        payPalDriver.requestBillingAgreement(request) { (tokenizedPayPalAccount, error) -> Void in
            if let tokenizedPayPalAccount = tokenizedPayPalAccount {
                print("Got a nonce: \(tokenizedPayPalAccount.nonce)")
                // Send payment method nonce to your server to create a transaction
            } else if let error = error {
                // Handle error here...
            } else {
                // Buyer canceled payment approval
            }
        }
        
    }
    @IBAction func btnPay(_ sender: Any) {
        self.startCheckout()
    }
    func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {
        print("appSwitcherWillPerformAppSwitch")
    }
    
    func appSwitcher(_ appSwitcher: Any, didPerformSwitchTo target: BTAppSwitchTarget) {
        print("didPerformSwitchTo")
    }
    
    func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {
        print("appSwitcherWillProcessPaymentInfo")
    }
    
    func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
}

