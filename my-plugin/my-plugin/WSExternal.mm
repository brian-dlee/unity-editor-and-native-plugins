//
//  WSExtenal.mm
//  my-plugin
//

#import <Foundation/Foundation.h>
#import <my_plugin-Swift.h>

extern "C" {
  
  // WS
  typedef void(*ws_message_listener_t)(const char*);
  
  ws_message_listener_t wsMessageEventListener = 0;
  
  void handleWSMessage(NSString* text) {
    const char* cString = [text cStringUsingEncoding:NSUTF8StringEncoding];
    
    if (wsMessageEventListener != 0) {
      wsMessageEventListener(cString);
    }
  }
  
  void WSSetMessageListener(long pointer) {
    wsMessageEventListener = (ws_message_listener_t)(pointer);
  }
  
  void WSOpen() {
    [WS.shared connect];
  }
  
  void WSSend(const char* text) {
    [WS.shared send:[NSString stringWithUTF8String:text]];
  }
  
  void WSClose() {
    [WS.shared disconnect];
  }
  
  ExternalWSDelegate* wsDelegate;
  
  /**
   * Constructor
   */
  __attribute__((constructor)) void init(void) {
    wsDelegate = [[ExternalWSDelegate alloc] initOnMessage:handleWSMessage];
    WS.shared.delegate = wsDelegate;
  }
}
