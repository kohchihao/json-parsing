/*
 * An external module required to run this:
 *   npm install node-fetch
 */

import fetch from 'node-fetch';

const base = 'SGD';
const symbols = 'MYR';

class ApiResponse {
  base: string;
  date: string;
  rates: object;
}

fetch(`http://api.fixer.io/latest?symbols=${symbols}&base=${base}`)
  .then((response) => response.json() as ApiResponse)
  .then((data) => console.log(`${base}1 = ${symbols}${data.rates.MYR}`));
