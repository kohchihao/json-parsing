package parsing;

import java.io.IOException;
import java.text.DecimalFormat;

import org.apache.http.client.fluent.Request;
import org.json.JSONException;
import org.json.JSONObject;

public class Java {

	private static final String SYMBOL = "MYR";
	private static final String BASE = "SGD";
	private static final String URL = String.format("http://api.fixer.io/latest?symbols=%s&base=%s", SYMBOL, BASE);
	private static final DecimalFormat df = new DecimalFormat("#.####");

	public static void main(String...args) {
		try {
			String strJSON = Request.Get(URL)
			     .execute()
			     .returnContent()
			     .asString();
			double exchangeRate = new JSONObject(strJSON)
									.getJSONObject("rates")
									.getDouble(SYMBOL);
			System.out.println(String.format("%s1 = %s%s", BASE, SYMBOL, df.format(exchangeRate)));
		} catch (IOException | JSONException ex) {
			System.err.println(ex);
		}
	}
}
