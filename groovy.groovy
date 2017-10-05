import groovy.json.JsonSlurper;

def base = 'SGD';
def symbols = 'MYR';

def jsonSlurper = new JsonSlurper();
def apiResponse = jsonSlurper.parseText(
    new URL("http://api.fixer.io/latest?symbols=${symbols}&base=${base}").text
)
println "${base}1 = ${symbols}${apiResponse.rates.MYR}";
