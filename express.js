var express = require('express');

var app = express();

app.disable('x-powered-by');

app.set('port', process.env.PORT || 3000);

app.use(express.static('static'));

app.get('/', function(req, res)
{
	res.sendFile(__dirname + '/index.html');
});

app.get('/form', function(req, res)
{
	res.sendFile(__dirname + '/form.html');
});

app.listen(app.get('port'), function()
{
	console.log("listening on port: " + app.get('port'));
});