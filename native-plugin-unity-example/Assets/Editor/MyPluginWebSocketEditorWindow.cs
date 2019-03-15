using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace Editor {
    [Serializable]
    public class MyPluginWebSocketEditorWindow : EditorWindow
    {
        [MenuItem("Window/WebSocket Interface")]
        public static void ShowWindow() {
            GetWindow(typeof(MyPluginWebSocketEditorWindow), false, "WebSocket", true);
        }

        public List<string> messages = new List<string>();
        public string text = "";

        private void HandleWebSocketMessage(string message) {
            messages.Add(string.Copy(message));
            Repaint();
        }

        private void OnFocus() {
            MyPluginWebSocketConnector.Attach(HandleWebSocketMessage);
        }

        private void OnLostFocus() {
            MyPluginWebSocketConnector.Detach();
        }

        void OnGUI() {
            if (GUILayout.Button("Open")) {
                MyPluginWebSocketConnector.Open();
            }

            if (GUILayout.Button("Close")) {
                MyPluginWebSocketConnector.Close();
            }

            GUILayout.Label("Send a new message");
            text = GUILayout.TextArea(text);

            if (GUILayout.Button("Send")) {
                MyPluginWebSocketConnector.Send(text);
            }

            GUILayout.Label("Messages");

            foreach (string message in messages) {
                GUILayout.Label(message);
            }
        }
    }
}
