package eMarket.entity;

import org.apache.http.client.fluent.Request;

public class NetUtils {
	
	public static String GetResult(String url) {
        try {
            return Request.Get(url).setHeader("Accept-Charset", "utf-8").execute().returnContent().asString();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
	
}
