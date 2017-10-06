/*
 * Two external modules required to run this:
 *   npm install --save @akanass/rx-http-request rxjs
 * Require ts-node and typescript to run typescript on command line
 *   npm install -g ts-node
 * Install a TypeScript compiler (requires `typescript` by default).
 *   npm install -g typescript
 */
import {RxHR} from '@akanass/rx-http-request';

const symbol = 'MYR';
const base = 'SGD';
RxHR.get(`http://api.fixer.io/latest?symbols=${symbol}&base=${base}`)
  .subscribe((data) => {
      if (data.response.statusCode === 200) {
        const { rates } = JSON.parse(data.body);
        console.log(`${base}1 = ${symbol}${rates[symbol]}`);
      }
  }, (err) => {
      console.error(err);
  });
