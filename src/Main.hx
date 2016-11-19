import electron.main.App;
import electron.main.BrowserWindow;
import electron.CrashReporter;
import js.Node.*;

class Main {
    static function main() {
        CrashReporter.start({
            companyName : "hxelectron (not a company)",
            submitURL : "https://github.com/fponticelli/hxelectron/issues",
        });
        App.on('window-all-closed', function(e) {
            App.quit();
        });
        var mainWindow = null;
        App.on('ready', function(e) {
            mainWindow = new BrowserWindow( { width: 800, height: 600 } );
            mainWindow.loadURL( 'file://' + __dirname + '/app.html' );
            mainWindow.on('closed', function(){mainWindow = null;});
        });
    }
}
