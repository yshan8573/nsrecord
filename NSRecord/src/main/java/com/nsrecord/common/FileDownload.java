package com.nsrecord.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileDownload {
	
	private final String prePath = "/ProjectData/";

	@RequestMapping("/fileDownload.do")
	public void fileDown(String path, String oName,String rName, HttpServletRequest request, HttpServletResponse response)
	{
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;

		String saveDir= prePath + path;
		try {
			FileInputStream fis=new FileInputStream(new File(saveDir+"/"+rName));
			bis=new BufferedInputStream(fis);
			sos=response.getOutputStream();
			String resFilename="";
			boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE")!=-1||request.getHeader("user-agent").indexOf("Trident")!=-1;
			if(isMSIE) {
				resFilename=URLEncoder.encode(oName, "UTF-8");
				resFilename=resFilename.replaceAll("\\+","%20");
			}
			else
			{
				resFilename=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			response.setContentType("application/octet-stream;charset=UTF-8");
			response.addHeader("Content-Disposition", "attachment;filename=\""+resFilename+"\"");

			int read=0;
			while((read=bis.read())!=-1)
			{
				sos.write(read);
			}

		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		finally {
			try {

			bis.close();
			sos.close();
			}catch(IOException e)
			{
				e.printStackTrace();
			}
		}
	}
}
