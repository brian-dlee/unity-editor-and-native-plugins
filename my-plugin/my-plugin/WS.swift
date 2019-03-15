//
//  WS.swift
//  my-plugin
//

import Foundation
import Starscream

@objc
protocol WSDelegate : class {
  func wsDidReceiveMessage(_ text: String)
}

@objc
class WS : NSObject {
  @objc
  static var shared: WS = WS()
  
  @objc
  weak var delegate: WSDelegate? = nil
  private let socket: WebSocket
  
  override init() {
    self.socket = WebSocket(url: URL(string: "wss://echo.websocket.org")!)
    
    super.init()
    
    self.socket.delegate = self
  }
  
  @objc
  func connect() {
    if !self.socket.isConnected {
      self.socket.connect()
    }
  }
  
  @objc
  func send(_ message: String) {
    if self.socket.isConnected {
      self.socket.write(string: message)
    }
  }
  
  @objc
  func disconnect() {
    if self.socket.isConnected {
      self.socket.disconnect(forceTimeout: 0, closeCode: CloseCode.normal.rawValue)
    }
  }
}

extension WS : WebSocketDelegate {
  func websocketDidConnect(socket: WebSocketClient) {}
  func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {}
  func websocketDidReceiveData(socket: WebSocketClient, data: Data) {}
  func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
    self.delegate?.wsDidReceiveMessage(text)
  }
}
