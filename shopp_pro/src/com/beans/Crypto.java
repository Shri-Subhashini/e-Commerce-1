package com.beans;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
public class Crypto {
	
	public static String encode(String value)throws UnsupportedEncodingException{
		Base64.Encoder e = Base64.getEncoder();
		return e.encodeToString(value.getBytes("utf-8"));
	}

	public static String decode(String encrypted) throws UnsupportedEncodingException
	{
		byte[] b = Base64.getDecoder().decode(encrypted);
		return new String(b , "utf-8");
	}
	public static void main(String[] args) throws UnsupportedEncodingException
	{
		//System.out.println(encode("abc@!23"));
		//System.out.println(decode("YWJjQCEyMw=="));
	}
	
}
