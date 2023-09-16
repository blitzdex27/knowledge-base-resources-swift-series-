//
//  String+EmailValidation.swift
//  EmailValidationRegex
//
//  Created by Dexter Ramos on 9/16/23.
//

import Foundation

extension String {
    
    private static let regex: String = {
        "^(?:(?:(?:(?:[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-])+(?:(?:\\.(?!\\.))?(?:[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-])+)*)|(?:\"(?:[^\"\\\\]|\\\\.)*\"))@(?:(?:[a-zA-Z0-9])+(?:\\.(?:[a-zA-Z0-9])+(?:[a-zA-Z0-9-])*(?:[a-zA-Z0-9]))+))$"
    }()
    
    var isValidEmail: Bool {


        let pred = NSPredicate(format: "SELF MATCHES %@", Self.regex)
        return pred.evaluate(with: self)
    }
}
