//
//  ViewController.swift
//  CryptoECPractice
//
//  Created by Denis Sapalov on 28.11.2022.
//

import UIKit
import SwiftECC

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let domain = Domain.instance(curve: .EC384r1)
        //let (pubKey, privKey) = domain.makeKeyPair()
        
        let plainText = "Hi, there!"
        let aaData = "This is the additional authenticated data"

        let (pub, priv) = Domain.instance(curve: .EC256k1).makeKeyPair()
        let cipherText = pub.encryptChaCha(msg: Bytes(plainText.utf8), aad: Bytes(aaData.utf8))

        do {
            let text = try priv.decryptChaCha(msg: cipherText, aad: Bytes(aaData.utf8))
            print(String(bytes: text, encoding: .utf8)!)
        } catch {
            print("Exception: \(error)")
        }
    
    }
}

