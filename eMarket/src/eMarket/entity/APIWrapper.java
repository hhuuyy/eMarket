package eMarket.entity;

import com.google.gson.Gson;

public class APIWrapper {
	
	private static String appID = "112573639549368";
    private static String appSecret = "9c33680ec4565699cc4125dbb4a4d97f";
    private static String redirectUrl = "http://localhost:9999/SMarket/user/account/dangnhap.php";
    private String accessToken;
    private Gson gson;

    public APIWrapper() {
        gson = new Gson();
    }
	
    public static String getDialogLink() {
        String dialogLink = "https://www.facebook.com/dialog/oauth?client_id=112573639549368&redirect_uri=http://localhost:9999/SMarket/user/account/dangnhap.php&scope=public_profile";
        return String.format(dialogLink, appID, redirectUrl);
    }
	
    public String getAccessToken(String code) {
        String accessTokenLink = "https://graph.facebook.com/oauth/access_token?"
                + "client_id=%s"
                + "&client_secret=%s"
                + "&redirect_uri=%s"
                + "&code=%s";
        accessTokenLink = String.format(accessTokenLink, appID, appSecret, redirectUrl, code);
        if (code != null) {
            System.out.println("CODE : " + code);
        }
        String result = NetUtils.GetResult(accessTokenLink);
        System.out.println("RESULT : " + result);
        String token = null;
        if (result.substring(result.indexOf(":") + 2, result.indexOf(",") - 2) != null) {
            token = result.substring(result.indexOf(":") + 2, result.indexOf(",") - 2);
            System.out.println("TOKEN : " + token);
        }
//        token = result.substring(result.indexOf("=") + 1, result.indexOf("&"));
        return token;
    }

    public Customer getUserInfo() {
        String infoUrl = "https://graph.facebook.com/v2.12/me?fields=id,link,name,email,last_name&access_token=%s";
//    	String infoUrl = "https://graph.facebook.com/me?access_token=%s";
        System.out.println("ACCESS TOKEN : " + accessToken);
        infoUrl = String.format(infoUrl, this.accessToken);
        String result = NetUtils.GetResult(infoUrl);
        Customer customer = gson.fromJson(result, Customer.class);
        return customer;
    }

	public static String getAppID() {
		return appID;
	}

	public static void setAppID(String appID) {
		APIWrapper.appID = appID;
	}

	public static String getAppSecret() {
		return appSecret;
	}

	public static void setAppSecret(String appSecret) {
		APIWrapper.appSecret = appSecret;
	}

	public static String getRedirectUrl() {
		return redirectUrl;
	}

	public static void setRedirectUrl(String redirectUrl) {
		APIWrapper.redirectUrl = redirectUrl;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public Gson getGson() {
		return gson;
	}

	public void setGson(Gson gson) {
		this.gson = gson;
	}
    
    
}
