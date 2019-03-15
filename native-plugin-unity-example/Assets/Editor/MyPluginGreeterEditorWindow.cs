using System;
using UnityEditor;
using UnityEngine;

namespace Editor {
    [Serializable]
    public class MyPluginGreeterEditorWindow : EditorWindow
    {
        [MenuItem("Window/Greeter Interface")]
        public static void ShowWindow() {
            GetWindow(typeof(MyPluginGreeterEditorWindow), false, "Greeter", true);
        }

        private string greeting = "";

        void OnGUI() {
            if (GUILayout.Button("Greet Me")) {
                greeting = MyPluginGreeterConnector.GreetMe();
            }

            GUILayout.Label($"Greeting: {greeting}");
        }
    }
}
