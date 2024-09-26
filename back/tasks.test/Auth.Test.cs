using tasks.test.Base;
using Xunit.Abstractions;

namespace tasks.test
{
    public class Auth_Test : Base_Service_Test<Program>
    {

        public Auth_Test(ITestOutputHelper outputWriter) : base(outputWriter)
        {
        }

        [Fact]
        public void Login()
        {
        }
    }
}