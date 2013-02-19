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

/*var twitterAccount = casper.cli.get(0);
var filename       = casper.cli.get(1);

if (!twitterAccount || !filename || !/\.(png|jpg|pdf)$/i.test(filename)) {
    casper
        .echo("Usage: $ casperjs screenshot.coffee <twitter-account> <filename.[jpg|png|pdf]>")
        .exit(1)
    ;
}
*/
casper.start("http://google.com", function() {
//casper.start("http://google.com", function() {
	//this.captureSelector('D:\\casperjs\\google.png', "html");
	//this.fill('form', { UserName: 'daola', Password: '123123' }, true);	
	
	this.wait(200, (function() {
			//this.click('.nav-tabs li:nth-child(2) a');
			//this.click('#get-route');
			this.wait(100, (function() {
					//this.click('#get-route');
					this.captureSelector('D:\\Study\\FU\\Semester 9\\Capstone\\HDMS\\Code\\HDMS\\HDMS\\MapShots\\google.png', "html");
				})
			);
		})
	);
	
	
});

casper.echo('I am running');

/*casper.wait(5000, function(){
	casper.exit();
});*/

casper.run();
