package cookie;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class Cookie_Singleton {
    private static volatile Cookie_Singleton instance;

    private Gson gson = new Gson();
    private String name;
    private List<Map<String, String>> list;

    private Cookie_Singleton() {
    }

    public static Cookie_Singleton getInstance() {
        if (instance == null) {
            synchronized (Cookie_Singleton.class) {
                if (instance == null) {
                    instance = new Cookie_Singleton();
                }
            }
        }
        return instance;
    }
    
    public boolean isThereCookie() {
    	if (list == null || list.isEmpty()) {
    		return false;
    	}
    	return true;
    }

    public void setCookieInfo(String name, Cookie[] cookies) {
        this.name = name;
        this.list = getCookieValue(cookies);
    }
    
    public void uploadCookieToDB() {
    	// 주문 테이블 매니저 필요
    }
    
    public void verifyCookie(String key, Cookie_Verification cookie_Verfication) {
    	this.list = Verification(key, cookie_Verfication);
    }
    
    public void verifyCookieByTypeWithNo(String key, Cookie_Verification cookie_Verfication) {
    	this.list = VerificationByTypeWithNo(key, cookie_Verfication);
    }
    
    public void addCookie(HttpServletResponse response) {
    	Cookie cookie = new Cookie(name, gson.toJson(list));
        cookie.setHttpOnly(false);
        cookie.setMaxAge(-1);
        cookie.setSecure(true);
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    public void deleteCookie(HttpServletResponse response) {
        Cookie cookie = new Cookie(name, "");
        cookie.setHttpOnly(false);
        cookie.setMaxAge(0);
        cookie.setSecure(true);
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    public void clearValue() {
        this.list = null;
    }

    private List<Map<String, String>> Verification(String key, Cookie_Verification cookie_Verfication) {
        List<Map<String, String>> verifiedList = new ArrayList<>();
        for (Map<String, String> map : list) {
            if (cookie_Verfication.verification(map.get(key))) {
                verifiedList.add(map);
            }
        }
        return verifiedList;
    }

    private List<Map<String, String>> VerificationByTypeWithNo(String key, Cookie_Verification cookie_Verfication) {
        List<Map<String, String>> verifiedList = new ArrayList<>();
        for (Map<String, String> map : list) {
        	String type = map.get("type");
        	String no = map.get("no");
            if (cookie_Verfication.verificationByTypeWithNo(map.get(key), type, no)) {
                verifiedList.add(map);
            }
        }
        return verifiedList;
    }

    private List<Map<String, String>> getCookieValue(Cookie[] cookies) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals(name)) {
                try {
                    String value = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
                    return gson.fromJson(value, new TypeToken<ArrayList<Map<String, String>>>() {}.getType());
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }
}