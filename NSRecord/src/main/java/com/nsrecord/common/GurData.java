package com.nsrecord.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GrcDto;
import com.nsrecord.dto.GurDto;

public class GurData {
	
	private static HttpServletRequest request;

	public static GurDto read(GpxDto gpx, List<GrcDto> grcList) {
		
		GurDto gur = new GurDto();
		
		// gur에 gpx 정보 저장
		gur.setG_seq(gpx.getG_seq());
		gur.setU_seq(gpx.getU_seq());
		
		// 저장된 gpx 파일 가져오기
		String prePath = request.getSession().getServletContext().getRealPath("/resources/data/")+"/";
		String pathGpx = prePath + "gpx/gpx";
		String gpxFile = gpx.getG_re();
		
		List<Map> mapList = GpxReader.read(pathGpx, gpxFile);
		
		String startLatS = (String) mapList.get(0).get("lat");
		String startLonS = (String) mapList.get(0).get("lon");
		String startTimeS = (String) mapList.get(0).get("time");
		String endLatS = (String) mapList.get(mapList.size()-1).get("lat");
		String endLonS = (String) mapList.get(mapList.size()-1).get("lon");
		String endTimeS = (String) mapList.get(mapList.size()-1).get("time");
		
		// gpx 좌표 파싱
		double startLat = Double.parseDouble(startLatS);
		double startLon = Double.parseDouble(startLonS);
		double endLat = Double.parseDouble(endLatS);
		double endLon = Double.parseDouble(endLonS);
		
		
		// grc 리스트 검색 후 일치하는 gpx 코스 찾기
		GrcDto grc = null;
		for(int i=0;i<grcList.size();i++) {
			
			grc = grcList.get(i);
			
			String[] grcStart =  grc.getGrc_start().split(",");
			double grcLat = Double.parseDouble(grcStart[0]);
			double grcLon = Double.parseDouble(grcStart[1]);
			
			
			
			
			
			
		}
		
		
		

		
		
		
		
		return gur;
	}
}
