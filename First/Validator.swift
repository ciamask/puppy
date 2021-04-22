//
//  Validator.swift
//  SOCH
//
//  Created by Sujal Shr on 1/18/21.
//

import Foundation

enum FieldType {
    case email
    case password
    case phone
    case name
    case normal
    
    var minLength: Int? {
        switch self {
        case .email: return 3
        case .password: return 8
        case .phone: return 10
        case .name: return 1
        default: return nil
        }
    }
    
    var maxLength: Int? {
        switch self {
        case .email, .password: return 50
        case .phone: return 10
        case .name: return 50
        default: return nil
        }
    }
    
    var validationMessage: String? {
        switch self {
        case .email: return "Invalid Email"
        case .password: return "Password must be alphamumeric and atleast 8 characters"
        case .phone: return "Phone must be exact 10 digits"
        case .name: return "Enter required Information"
        default: return nil
        }
    }
}
