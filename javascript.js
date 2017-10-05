/*
 * An external module required to run this:
 *   npm install axios --save
 */
const axios = require('axios');
const symbol = 'MYR';
const base = 'SGD';
const url =
axios.get(`http://api.fixer.io/latest?symbols=${symbol}&base=${base}`)
  .then(function (response) {
    const { rates } = response.data;
    console.log(`${base}1 = ${symbol}${rates[symbol]}`);
  })
  .catch(function (error) {
    console.log(error);
  });
