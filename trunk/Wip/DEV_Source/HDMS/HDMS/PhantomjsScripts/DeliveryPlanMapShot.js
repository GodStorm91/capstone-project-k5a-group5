/*
 * This script will capture a screenshot of a twitter account page
 * Usage: $ casperjs screenshot.coffee <twitter-account> <filename.[jpg|png|pdf]>
 */

var casper = require("casper").create({
    viewportSize: {
        width: 1280,
        height: 1280
    }
});

var planDetailsPath = casper.cli.get(0);
var imageOutputPath = casper.cli.get(1);

if (!planDetailsPath || !imageOutputPath) {
    casper
        .echo("Invalid Arguments")
        //.exit(1)
    ;
}

/*var twitterAccount = casper.cli.get(0);
var filename       = casper.cli.get(1);

if (!twitterAccount || !filename || !/\.(png|jpg|pdf)$/i.test(filename)) {
    casper
        .echo("Usage: $ casperjs screenshot.coffee <twitter-account> <filename.[jpg|png|pdf]>")
        .exit(1)
    ;
}
*/

casper.start(planDetailsPath, function() {
	/*this.echo(planDetailsPath);
	this.echo(imageOutputPath);
	this.echo(numberOfElements);*/
	this.fill('form', { UserName: 'daola', Password: '123123' }, true);	
	
	this.waitUntilVisible('.nav-tabs li:nth-child(2) a', function() {
		this.click('.nav-tabs li:nth-child(2) a');
		this.waitUntilVisible('#get-route', function() {
			this.click('#get-route');
			this.waitForSelector('#get-route-done', function() {
				this.wait(8000, function() {
					this.captureSelector(imageOutputPath, "#map-wrapper");
					this.exit();
				});
				this.wait(6000, function() {
					this.exit();
				});
			}, function() {
				this.echo('error done');
				//this.exit();
			}, 40000);
		}, function() {
			this.echo('error button');
			//this.exit();
		}, 2000);
	}, function() {
		this.echo('error tab');
		//this.exit();
	}, 2000);
	
	
	
	/*this.waitForSelector("#map", (function() {
		this.captureSelector('tictac.png', "html");
		//this.echo("Saved screenshot of " + (this.getCurrentUrl()) + " to " + filename);
	}), (function() {
		this.die("Timeout reached. Fail whale?");
		this.exit();
	}), 10000);*/
	
});

casper.run();
