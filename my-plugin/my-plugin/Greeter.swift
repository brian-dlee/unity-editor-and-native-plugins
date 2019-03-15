//
//  Greeter.swift
//  my-plugin
//

import Foundation

@objc
class Greeter : NSObject {
  @objc
  static var shared = Greeter()
  
  @objc
  func getRandomGreeting() -> String {
    return ["Hi.", "Hey!", "Hello, there."].randomElement() ?? "..."
  }
}
