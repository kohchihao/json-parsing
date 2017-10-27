var request = require("request")
var symbol="MYR";
var base="SGD";
var url = "http://api.fixer.io/latest?symbols="+symbol+"&base="+base;

request({
    url: url,
    json: true,
    headers: {'User-Agent': 'request'}
}, function (error, response, body) {

    if (!error && response.statusCode === 200) {
        
        console.log(symbol+" "+body.rates[symbol]);
        // var str=JSON.stringify(obj, null, 4);
        // console.log(str);
    }
})