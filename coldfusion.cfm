<cfhttp url="http://api.fixer.io/latest?symbols=MYR&base=SGD" method="GET" />

<cfset response=cfhttp.fileContent />

<cfif NOT isJSON(response)>
    <h3>The URL you requested does not provide valid JSON</h3>
<cfelse>
    <cfset parsedResponse=deserializeJSON(response) />
    <cfoutput>#parsedResponse.base# = #structKeyList(parsedResponse.rates) & numberFormat(parsedResponse.rates.MYR, '_.0')#</cfoutput>
</cfif>