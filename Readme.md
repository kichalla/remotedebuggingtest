This repo is for testing remote debugging a .NET Core app using Visual Studio.

NOTE:
Change the contents of the file `RuntimeImage/authorized_keys` to have the public key that your machine generates.

Thanks to this article for helping to setup this:
https://blog.quickbird.uk/debug-netcore-containers-remotely-9a103060b2ff

For VS Code: https://www.aaron-powell.com/posts/2019-04-04-debugging-dotnet-in-docker-with-vscode/

### Running the runtime image
docker run -p 5000:5000 -p 2222:2222 -d todoapp

### Debugging the app

1. Open VS | Select Debug from menu | Attach to Proces... | Select SSH from the 'Connection Type' drop down | Enter or select 'root@localhost' for 'Connection target'

2. You should see a window popup asking for credentials. Enter the following values for the different fields:
  Host name: localhost
  Port: 2222
  Username: root
  Authentication Type: Private Key
  Private Key file: Choose the private key file
  Passphrase: <passphrase-here-if-you-have-protected-private-key-file-with-password>

3. Open the solution in VS and set a breakpoint in `HomeController`'s `Index` action and try navigating the url `http://localhost:5000` and you should see your breakpoint hit.

4. Try accessing the `HttpContext` from `Locals` window to see the current request's information and also try looking into `Modules` window to find that the symbols are loaded from the container.
