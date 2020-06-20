package com.nsrecord.common;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.nsrecord.dto.GpxFile;

public class GpxReader {

	private final static String prePath = "/ProjectData/gpx/";
	
	public static List<GpxFile> read(String g_re) {
		
		List<GpxFile> gfList = new ArrayList<GpxFile>(); // gpx 정보 List
		GpxFile gf = null; // gpx 정보
		
		try {
			File file = new File(prePath + g_re);
			DocumentBuilderFactory docBuildFact = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuild = docBuildFact.newDocumentBuilder();
			Document doc = docBuild.parse(file);
			doc.getDocumentElement().normalize();
 
			System.out.println("Root element : " + doc.getDocumentElement().getNodeName());
			System.out.println();
 
			// trkpt 엘리먼트 리스트
			NodeList trkptlist = doc.getElementsByTagName("trkpt");
 
			for (int i = 0; i < trkptlist.getLength(); i++) {
				
				gf = new GpxFile(); // GpxFile 초기화
 
				Node trkptNode = trkptlist.item(i);
 
				if (trkptNode.getNodeType() == Node.ELEMENT_NODE) {
					
					// trk엘리먼트 
					Element trkptElmnt = (Element) trkptNode;
					
					// trkpt 속성 lat, lon (위도, 경도)
					String latValue = trkptElmnt.getAttribute("lat");
					String lonValue = trkptElmnt.getAttribute("lon");
					gf.setLat(latValue);
					gf.setLon(lonValue);
					
 
					// ele 태그 (고도)
					NodeList eleList= trkptElmnt.getElementsByTagName("ele");
					Element eleElmnt = (Element) eleList.item(0);
					Node ele = eleElmnt.getFirstChild();
					String eleValue = ele.getNodeValue();
					gf.setEle(eleValue);
 
					// time 태그
					NodeList timeList= trkptElmnt.getElementsByTagName("time");
					Element timeElmnt = (Element) timeList.item(0);
					Node time = timeElmnt.getFirstChild();
					String timeValue = time.getNodeValue();
					gf.setTime(timeValue);
				}
				
				gfList.add(gf);
 
			}
 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gfList;

	}
	
}
