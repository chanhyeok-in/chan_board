package com.spring.board.controller;

import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
import java.util.UUID;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.digest.Crypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.dto.MemberDto;
import com.spring.board.service.MemberService;
import org.json.simple.*;
/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/otp")
public class GoogleOtpTestController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoogleOtpTestController.class);
	
	@Autowired
    private MemberService memberService;
	
	/**
	 * 濡쒓렇�씤 �엯�젰李�
	 * @throws ServletRequestBindingException 
	 */
	@RequestMapping(value = "/login")
	public String first(HttpServletRequest request, Model model) throws ServletRequestBindingException {
		
		String result = ServletRequestUtils.getStringParameter(request, "result","");
		model.addAttribute("result", result );
		
		return "googleotp/login";
	}
	
	/**
	 * �쉶�썝媛��엯 李�
	 * @throws ServletRequestBindingException 
	 */
	@RequestMapping(value = "/newMember")
	public String newMember(HttpServletRequest request, Model model) throws ServletRequestBindingException {
		
		String result = ServletRequestUtils.getStringParameter(request, "result","");
		model.addAttribute("result", result );
		
		return "googleotp/newMember";
	}
	
	/**
	 * �쉶�썝媛��엯 李�
	 * @throws ServletRequestBindingException 
	 */
	@RequestMapping(value = "/proton")
	public String proton(HttpServletRequest request, Model model) throws ServletRequestBindingException {
		
		String result = ServletRequestUtils.getStringParameter(request, "result","");
		model.addAttribute("result", result );
		
		return "googleotp/protonTransfer";
	}
	
	/**
	 * �쉶�썝媛��엯 李�
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value = "/newMemberAjax" ,produces="application/json;charset=UTF-8")
	public JSONArray newMemberAjax(HttpServletRequest request, Model model) throws Exception {
		
		String memberEmailq=getRandomString();
		String memberMemo="";
		String result="fail";
		String checkMem="";
		MemberDto memberDto = new MemberDto();
		memberDto.setUSER_ID(request.getParameter("USER_ID"));
		int aaa = memberService.checkMember(memberDto);
		checkMem=memberDto.getCOUNT();
		if(aaa!=0){
			memberMemo="�씠誘� 媛��엯�맂 �씠硫붿씪�엯�땲�떎.";
			result="fail";
		}else{
			memberMemo="�솢�꽦�솕 硫붿씪�씠 諛쒖넚�릺�뿀�뒿�땲�떎. �씠硫붿씪�뿉�꽌 �솗�씤 留곹겕瑜� �겢由��떆 怨꾩젙�씠 �솢�꽦�솕 �맗�땲�떎. 硫붿씪�씠 �삤吏� �븡�뒗�떎硫�, �뒪�뙵硫붿씪�븿�쓣 �솗�씤�빐 二쇱떆湲� 諛붾엻�땲�떎.";
			memberDto = new MemberDto();
			memberDto.setUSER_ID(request.getParameter("USER_ID"));
			Base32 codec = new Base32();
			byte[] bEncodedKey = codec.encode(request.getParameter("USER_PW").getBytes());
	         
	        // �깮�꽦�맂 Key!
	        String encodedKey = new String(bEncodedKey);
			memberDto.setUSER_PW(encodedKey);
			memberDto.setEMAIL_CODE(memberEmailq);
			memberService.insertMember(memberDto);
			result="success";
		}
		
		JSONArray jsonarr = new JSONArray();
		jsonarr.add(0,memberMemo);
		jsonarr.add(1,memberEmailq);
		jsonarr.add(2,result);
		return jsonarr;
	}
	
	/**
	 * �씠硫붿씪 �씤利�
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value = "/emailVaildAjax" ,produces="application/json;charset=UTF-8")
	public String emailVaildAjax(HttpServletRequest request,HttpServletRequest response, Model model) throws Exception {
		
		
			MemberDto memberDto = new MemberDto();
			memberDto.setUSER_ID(request.getParameter("USER_ID"));
			memberDto.setEMAIL_CODE(request.getParameter("EMAIL_CODE"));
			memberService.emailVaild(memberDto);
			response.setCharacterEncoding("UTF-8");
			String result = "<script>alert('�씠硫붿씪 �씤利앹씠 �셿猷뚮릺�뿀�뒿�땲�떎.'); location.href='/otp/login'; </script>";



		
		
		return result;
	}
	
	/** 32湲��옄�쓽 �옖�뜡�븳 臾몄옄�뿴(�닽�옄�룷�븿) �깮�꽦 */
    public static String getRandomString() {
 
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
    public static String nvl(String str, String defaultStr) {
        return str == null ? defaultStr : str ;
	}
    
	/**
	 * �쉶�썝媛��엯 李�
	 * @throws ServletRequestBindingException 
	 */
	@RequestMapping(value = "/checkEmail")
	public String checkEmail(HttpServletRequest request, Model model) throws ServletRequestBindingException {
		
		String result = ServletRequestUtils.getStringParameter(request, "result","");
		model.addAttribute("result", result );
		
		return "googleotp/login";
	}
	
	final String test_id = "admin";
	final String test_pw = "1111";
	
	/**
	 * id/pw 鍮꾧탳 諛� �꽦怨듭씤 寃쎌슦 google otp �깮�꽦 �썑 �엯�젰李� 由ы꽩
	 * @param request
	 * @param locale
	 * @param model
	 * @return
	 * @throws ServletRequestBindingException 
	 */
	@RequestMapping(value = "/second")
	public String second(HttpServletRequest request, Locale locale, Model model) throws ServletRequestBindingException {
		
		String id= ServletRequestUtils.getStringParameter(request, "user_id");
		String pw= ServletRequestUtils.getStringParameter(request, "user_pw");
		
		if(id.equals(test_id) && pw.equals(test_pw))
		{
			String secretKeyStr = "GXRZIYSI";//generateSecretKey();// 留ㅻ쾲 �깮�꽦�븯吏� �븡怨� �븳踰� �깮�꽦�맂 �궎瑜� �궗�슜.
			String url = getQRBarcodeURL(id, "ChanBoardLogin", secretKeyStr); // �깮�꽦�맂 諛붿퐫�뱶 二쇱냼!
	        // userName怨� hostName�� 蹂��닔濡� 諛쏆븘�꽌 �꽔�뼱�빞 �븯吏�留�, �뿬湲곗꽑 �뀒�뒪�듃瑜� �쐞�빐 �븯�뱶肄붾뵫 �빐以щ떎.
	        System.out.println("URL : " + url);
	        
			model.addAttribute("secretKey", secretKeyStr);
			model.addAttribute("url", url);
			//otp �깮�꽦
			return "googleotp/second";
		}
		else
		{
			return "redirect:first?result=fail";
		}
		
		
	}
	
	
	/**
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/third")
	public String select(HttpServletRequest req, Model model) {
		
		String user_codeStr = req.getParameter("user_code");
        long user_code = Integer.parseInt(user_codeStr);
        String encodedKey = req.getParameter("secretKey");
        long l = new Date().getTime();
        long ll =  l / 30000;
         
        boolean check_code = false;
        try {
            // �궎, 肄붾뱶, �떆媛꾩쑝濡� �씪�쉶�슜 鍮꾨�踰덊샇媛� 留욌뒗吏� �씪移� �뿬遺� �솗�씤.
            check_code = check_code(encodedKey, user_code, ll);
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        
        if(check_code){
        	return "googleotp/third";
        }else{
        	return "redirect:first?result=fail_otp";
        }
        
        
	}
	
	private String generateSecretKey(){
		
		// Allocating the buffer
//      byte[] buffer = new byte[secretSize + numOfScratchCodes * scratchCodeSize];
        byte[] buffer = new byte[5 + 5 * 5];
         
        // Filling the buffer with random numbers.
        // Notice: you want to reuse the same random generator
        // while generating larger random number sequences.
        new Random().nextBytes(buffer);
 
        // Getting the key and converting it to Base32
        Base32 codec = new Base32();
//      byte[] secretKey = Arrays.copyOf(buffer, secretSize);
        byte[] secretKey = Arrays.copyOf(buffer, 5);
        byte[] bEncodedKey = codec.encode(secretKey);
         
        // �깮�꽦�맂 Key!
        String encodedKey = new String(bEncodedKey);
         
        System.out.println("encodedKey : " + encodedKey);
        
        
        return encodedKey;
	}
	
	public static String getQRBarcodeURL(String user, String host, String secret) {
        String format = "http://chart.apis.google.com/chart?cht=qr&amp;chs=300x300&amp;chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&amp;chld=H|0";
         
        return String.format(format, user, host, secret);
    }
	
	private static boolean check_code(String secret, long code, long t) throws NoSuchAlgorithmException, InvalidKeyException {
        Base32 codec = new Base32();
        byte[] decodedKey = codec.decode(secret);
 
        // Window is used to check codes generated in the near past.
        // You can use this value to tune how far you're willing to go.
        int window = 3;
        for (int i = -window; i <= window; ++i) {
            long hash = verifyGoogleOtp(decodedKey, t + i);
 
            if (hash == code) {
                return true;
            }
        }
 
        // The validation code is invalid.
        return false;
    }
	
	
	private static int verifyGoogleOtp(byte[] key, long t)
            throws NoSuchAlgorithmException, InvalidKeyException {
        byte[] data = new byte[8];
        long value = t;
        for (int i = 8; i-- > 0; value >>>= 8) {
            data[i] = (byte) value;
        }
 
        SecretKeySpec signKey = new SecretKeySpec(key, "HmacSHA1");
        Mac mac = Mac.getInstance("HmacSHA1");
        mac.init(signKey);
        byte[] hash = mac.doFinal(data);
 
        int offset = hash[20 - 1] & 0xF;
 
        // We're using a long because Java hasn't got unsigned int.
        long truncatedHash = 0;
        for (int i = 0; i < 4; ++i) {
            truncatedHash <<= 8;
            // We are dealing with signed bytes:
            // we just keep the first byte.
            truncatedHash |= (hash[offset + i] & 0xFF);
        }
 
        truncatedHash &= 0x7FFFFFFF;
        truncatedHash %= 1000000;
 
        return (int) truncatedHash;
    }
}
