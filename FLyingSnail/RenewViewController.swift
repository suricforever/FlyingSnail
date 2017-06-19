//
//  RenewViewController.swift
//  FLyingSnail
//
//  Created by Suric on 2017/4/11.
//  Copyright © 2017年 snail. All rights reserved.
//

import UIKit
import StoreKit

class RenewViewController: UIViewController {
    @IBOutlet weak var productionButton: UIButton!
    
    var productRequest: SKProductsRequest!
    var oneYearProduct: SKProduct?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        fetchProducts(matchingIdentifiers: ["com.snail.Snail.oneyearfor10person", "com.snail.Snail.enterprise.oneyear.1"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func purchase(_ sender: UIButton) {
        guard let oneYearProduct = oneYearProduct else {
            print("没有可购买的项目")
            return
        }
        
        guard SKPaymentQueue.canMakePayments() else {
            print("此设备不能进行支付")
            return
        }
        
        let payment = SKMutablePayment(product: oneYearProduct)
        payment.quantity = 2
        SKPaymentQueue.default().add(payment)
    }
    
    @IBAction func restoreAction(_ sender: Any) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    // MARK: - Private Methods
    func fetchProducts(matchingIdentifiers identifiers: [String]) {
        let productIdentifiers = Set(identifiers)
        productRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
        productRequest.delegate = self
        productRequest.start()
    }
}

// MARK: - SKProductsRequestDelegate
extension RenewViewController: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        // No purchase will take place if there are no products available for sale.
        // As a result, StoreKit won't prompt your customer to authenticate their purchase.
        if response.products.count > 0 {
            // Use availableProducts to populate your UI.
            let availableProducts = response.products
            print("availableProducts: \(availableProducts)")
            
            let oneYearProduct = response.products[0]
            let price = formatProductionPrice(for: oneYearProduct)
            productionButton.setTitle("\(oneYearProduct.localizedTitle)  \(price) 点击支付", for: .normal)
            self.oneYearProduct = oneYearProduct
        } else {
            print("invalidProductIdentifiers: \(response.invalidProductIdentifiers)")
        }
    }
    
    func formatProductionPrice(for product: SKProduct) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.formatterBehavior = .behavior10_4
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = product.priceLocale
        return numberFormatter.string(from: product.price) ?? ""
    }
}
