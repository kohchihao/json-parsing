using System;
using System.Net;
using Newtonsoft.Json;

namespace Parsing
{
    class Program
    {
        // Get the content from the given URL as a string.
        static string FetchDataFromUrl(string url)
        {
            using (var client = new WebClient())
            {
                return client.DownloadString(url);
            }
        }

        static void Main(string[] args)
        {
            // Get the JSON data from the Fixer API.
            var json = FetchDataFromUrl("http://api.fixer.io/latest?symbols=MYR&base=SGD");
            dynamic results = JsonConvert.DeserializeObject(json);

            // Find the MYR conversion rate.
            var rate = results.rates.MYR;

            // Output the conversion rate from SGB to MYR.
            Console.WriteLine($"SGD1 = MYR{rate}");
            Console.ReadLine();
        }
    }
}
