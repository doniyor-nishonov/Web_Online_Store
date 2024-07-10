package com.pdp.web_online_store.utils;

public class StringUtils {
    public static boolean contains(String str, String query) {
        return str.toLowerCase().contains(query.toLowerCase());
    }
}
