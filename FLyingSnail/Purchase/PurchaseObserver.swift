//
//  PurchaseObserver.swift
//  FLyingSnail
//
//  Created by Suric on 2017/4/6.
//  Copyright © 2017年 snail. All rights reserved.
//

import UIKit
import StoreKit

class PurchaseObserver: NSObject {
    static let shared = PurchaseObserver()
}

extension PurchaseObserver: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        transactions.forEach { (paymentTransaction) in
            print("paymentTransaction: \(paymentTransaction.transactionIdentifier)")
            switch paymentTransaction.transactionState {
            case .purchased:
                print("支付成功")
                SKPaymentQueue.default().finishTransaction(paymentTransaction)
            case .purchasing:
                print("支付中...")
            case .restored:
                print("已经购买过商品")
                SKPaymentQueue.default().finishTransaction(paymentTransaction)
            case .failed:
                print("购买失败: \(paymentTransaction.transactionIdentifier) \(paymentTransaction.error?.localizedDescription ?? "")")
                SKPaymentQueue.default().finishTransaction(paymentTransaction)
            case .deferred:
                print("等待父母授权")
            }
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        print("removedTransactions \(transactions)")
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
       print("Success RestoreCompletedTransactions")
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        print("Failed RestoreCompletedTransactions")
    }

}
