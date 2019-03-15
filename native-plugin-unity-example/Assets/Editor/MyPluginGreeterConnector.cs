using System.Runtime.InteropServices;
using System.Text;

namespace Editor
{
    public static class MyPluginGreeterConnector
    {
        [DllImport("my-plugin")]
        private static extern void GreetMe(StringBuilder greeting);

        public static string GreetMe() {
            var sb = new StringBuilder();
            GreetMe(sb);
            return sb.ToString();
        }
    }
}
