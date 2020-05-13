//
//  DefaultStyles.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/15/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

public enum DefaultStyles {
    
    public enum Colors {
        
        /**
         Hex => 59B58D
        */
        public static let SSBaseColor: UIColor = {
            return UIColor("59B58D")
        }()
        
        /**
        Hex => 455154
        */
        public static let SSGray99: UIColor = {
            return UIColor("455154")
        }()
        
        /**
        Hex => 969FA2
        */
        public static let SSGray79: UIColor = {
            return UIColor("969FA2")
        }()
        
        /**
        Hex => C4CACC
        */
        public static let SSGray59: UIColor = {
            return UIColor("C4CACC")
        }()
        
        /**
        Hex => E7EAEB
        */
        public static let SSGray39: UIColor = {
            return UIColor("E7EAEB")
        }()
        
        /**
        Hex => F4F6F6
        */
        public static let SSGray19: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                    if UITraitCollection.userInterfaceStyle == .dark {
                        // Return Color For Dark Mode
                        return UIColor.systemGray6
                    } else {
                        // Return Color For Light Mode
                        return UIColor("F4F6F6")
                    }
                }
            } else {
                return UIColor("F4F6F6")
            }
        }()
        
        public static let SSLabelColor: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                    if UITraitCollection.userInterfaceStyle == .dark {
                        // Return Color For Dark Mode
                        return UIColor.label
                    } else {
                        // Return Color For Light Mode
                        return Colors.SSGray99
                    }
                }
            } else {
                return Colors.SSGray99
            }
        }()
        
        public static let SSShadowColor: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                    if UITraitCollection.userInterfaceStyle == .dark {
                        // Return Color For Dark Mode
                        return .clear
                    } else {
                        // Return Color For Light Mode
                        return SSGray39
                    }
                }
            } else {
                return .clear
            }
        }()
        
        public static let SSSeperatorColor: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                    if UITraitCollection.userInterfaceStyle == .dark {
                        // Return Color For Dark Mode
                        return .systemGray4
                    } else {
                        // Return Color For Light Mode
                        return .systemGray5
                    }
                }
            } else {
               return .systemGray5
            }
        }()
    }
}

extension UIColor {
    convenience init(_ hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
