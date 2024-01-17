//
//  Protocol.swift
//  APIPractice
//
//  Created by 은서우 on 2024/01/17.
//

import UIKit

protocol ReusableProtocol {
    static var identifier: String { get }
}

extension UICollectionViewCell: ReusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
}
