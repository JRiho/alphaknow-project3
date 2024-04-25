package com.spring.alphaknow.QRcode;


import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		QR qr = new QR();
		qr.create("Welcome home", "qr_bom", "png");
		model.addAttribute("qr", "qr_bom.png");

		return "home";
	}
	
	@RequestMapping("/generateQR")
	@ResponseBody
	public String generateAndDownloadQR(@RequestParam("data") String data) throws Exception {
	    String fileName = "qr_bom";  // 파일명
	    QR qr = new QR();
	    qr.create(data, fileName, "png");
	    return "download?fileName=qr_bom.png";  
	}


	
	
	@RequestMapping("/download")
	public void download(HttpServletResponse response, 
			@RequestParam("fileName") String fileName) {
		FileDownload fileDownload = new FileDownload();
		try {
			fileDownload.download(response, fileName);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
}
