//
//  Extenal.mm
//  my-plugin
//

#import <Foundation/Foundation.h>
#import <my_plugin-Swift.h>

extern "C" {
  
  const void GreetMe(char* greeting) {
    const char* result = [Greeter.shared getRandomGreeting].UTF8String;
    
    if (greeting != NULL && result != NULL) {
      strcpy(greeting, result);
    }
    
    return;
  }
  
}
