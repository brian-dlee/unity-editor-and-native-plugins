# Unity Editor and Native Plugins

> Organization: [Las Vegas Unity3d Meetup](https://www.meetup.com/Las-Vegas-Unity3D-Meetup/)
>
> Event: [Integrating native plugins with Unity on March 14th, 2019](https://www.meetup.com/Las-Vegas-Unity3D-Meetup/events/pndflqyzfbsb/)
>
> Author: Brian Lee <brian.lee@aifoundation.com>

## Demonstration Code

Here is a brief example of how to use native plugins in the Unity editor. This demonstration has two parts: greeter and websocket. 

The greeter is a simple example illustrating how to get started with native plugins. This is simple plugin that returns a random greeting to Unity when invoked.

The WebSocket example for a more real-world scenario on how we might use native plugins in our applications. It establishes a WebSocket connection to `echo.websocket.org`, sends messages through the connection (originating from the Unity editor), and displays the response in a Unity editor window.

## Project breakdown
 * my-plugin
    * An XCode project to build a mac compatibly `*.bundle` that can be installed into the Unity `Assets/Plugins` directory and loaded as a native plugin
    * There is a script in `scripts` that will automatically copy the build results to the Unity project after each successful build
    * If you move these scripts around, make sure to update the build script.
 * native-plugin-unity-example
    * A Unity project including two editor windows
    * Each editor window can be accessed from the top level "Window" menu item and correspond with a different plugin example

*Note: This code only works on Mac. If you don't have access to a mac, try building a Windows DLL with the same exposed function names and get the same Unity project working on Windows.*

