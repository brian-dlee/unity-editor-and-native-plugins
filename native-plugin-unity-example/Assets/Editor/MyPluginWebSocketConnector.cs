using System;
using System.Runtime.InteropServices;

namespace Editor {
    public delegate void MessageEventHandlerDelegate(string text);

    public static class MyPluginWebSocketConnector {
        [DllImport("my-plugin")]
        static extern void WSOpen();

        [DllImport("my-plugin")]
        static extern void WSClose();

        [DllImport("my-plugin")]
        static extern void WSSend(string text);

        [DllImport("my-plugin")]
        private static extern void WSSetMessageListener(IntPtr function);

        public static void Close() {
            WSClose();
        }

        public static void Send(string text) {
            WSSend(text);
        }

        public static void Open() {
            WSOpen();
        }

        public static void Detach() {
            WSSetMessageListener(IntPtr.Zero);
        }

        public static void Attach(MessageEventHandlerDelegate handler) {
            WSSetMessageListener(
                Marshal.GetFunctionPointerForDelegate(handler)
            );
        }
    }
}
