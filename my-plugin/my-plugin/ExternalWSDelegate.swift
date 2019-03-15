//
//  ExternalWSDelegate.swift
//  my-plugin
//

import Foundation

typealias MessageCallback = @convention(c) (String) -> Void

@objc
class ExternalWSDelegate : NSObject, WSDelegate {
  private let onMessage: MessageCallback
  
  @objc
  init(onMessage: @escaping MessageCallback) {
    self.onMessage = onMessage
  }
  
  func wsDidReceiveMessage(_ text: String) {
    self.onMessage(text)
  }
}
