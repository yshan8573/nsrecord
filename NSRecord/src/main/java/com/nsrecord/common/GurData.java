package com.nsrecord.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import com.nsrecord.dto.GpxDto;
import com.nsrecord.dto.GrcDto;
import com.nsrecord.dto.GurDto;

public class GurData {
	
	private static HttpServletRequest request;

	public static GurDto read(String path, GpxDto gpx, List<GrcDto> grcList) {
		
		GurDto gur = new GurDto();
		
		// gur에 gpx 정보 저장
		gur.setG_seq(gpx.getG_seq());
		gur.setU_seq(gpx.getU_seq());
		
		// 저장된 gpx 파일 가져오기
		
		String gpxFile = gpx.getG_re();
		
		List<Map> mapList = GpxReader.read(path, gpxFile);
		

		// grc 리스트 검색 후 일치하는 gpx 코스 찾기
		GrcDto grc = null;
		
		// gpx값 좌표 변수 선언
		String gpxLatS = "";
		String gpxLonS = "";
		
		// gpx 기준 시작,종료 좌표 변수 선언
		String startLocS = "";
		String endLocS = "";
		
		// gpx 값 좌표 뽑아내기
		for(int i=0;i<mapList.size();i++) {
			gpxLatS = (String) mapList.get(i).get("lat");
			gpxLonS = (String) mapList.get(i).get("lon");
			String gpxTimeS = (String) mapList.get(i).get("time");
			
			double gpxLat = Double.parseDouble(gpxLatS);
			double gpxLon = Double.parseDouble(gpxLonS);
			
			// 유사 좌표를 찾기 위한 숫자 버림
			double gpxLatIf = Math.floor(gpxLat*1000);
			double gpxLonIf = Math.floor(gpxLon*1000);
			
			// 좌표값 콘솔 출력
//			System.out.println("startLatIf : " + startLatIf);
//			System.out.println("startLonIf : " + startLonIf);
			
			// gpx와 grc 비교
			for(int j=0;j<grcList.size();j++) {
				
				grc = grcList.get(j);
				
				// grc 시작 좌표 구하기
				String[] grcStart =  grc.getGrc_start().split(",");
				double startLat = Double.parseDouble(grcStart[0]);
				double startLon = Double.parseDouble(grcStart[1]);
				
				double startLatIf = Math.floor(startLat*1000);
				double startLonIf = Math.floor(startLon*1000);
				
				// 좌표값 콘솔 출력
//				System.out.println("grcLatIf : " + grcLatIf);
//				System.out.println("grcLonIf : " + grcLonIf);

				// grc 종료 좌표 구하기
				String[] grcEnd =  grc.getGrc_end().split(",");
				double endLat = Double.parseDouble(grcEnd[0]);
				double endLon = Double.parseDouble(grcEnd[1]);
				
				double endLatIf = Math.floor(endLat*1000);
				double endLonIf = Math.floor(endLon*1000);
				
				// 좌표값 콘솔 출력
//				System.out.println("grcLatIf : " + grcLatIf);
//				System.out.println("grcLonIf : " + grcLonIf);
				
				
				
				// 시작 좌표와 일치하는 값 찾기
				if(gpxLatIf == startLatIf && gpxLonIf == startLonIf) {
					// 일치 되는 값만 모으기
					//System.out.println("[시작 좌표] grcList : " + grcList.get(j).getGrc_title() + " || gpxLat : " + gpxLat + " || gpxLon : " + gpxLon);
					
					startLocS += i + ",";
					
				}
				
				// 종료 좌표와 일치하는 값 찾기
				if(gpxLatIf == endLatIf && gpxLonIf == endLonIf) {
					
					// 일치 되는 값만 모으기
					//System.out.println("[종료 좌표] grcList : " + grcList.get(j).getGrc_title() + " || gpxLat : " + gpxLat + " || gpxLon : " + gpxLon);
					
					endLocS += i + ",";
				}
				
				
				
				
				
			}
			
			
		}
		
		// gpx 기준 시작,종료 좌표 변수 변환
		startLocS = startLocS.substring(0, startLocS.length()-1);
		endLocS = endLocS.substring(0, endLocS.length()-1);
		
		String[] startLocSArr = startLocS.split(",");
		String[] endLocSArr = endLocS.split(",");
		
		
//		System.out.println(startLocS);
//		System.out.println(endLocS);
//		System.out.println(startLocSArr[Math.round(startLocSArr.length/2)]);
//		System.out.println(endLocSArr[Math.round(endLocSArr.length/2)]);

		
		int startLoc = Integer.parseInt(startLocSArr[Math.round(startLocSArr.length/2)]);
		int endLoc = Integer.parseInt(endLocSArr[Math.round(endLocSArr.length/2)]);
		
		Map<String,String> startMap = new HashMap<String,String>();
		Map<String,String> endMap = new HashMap<String,String>();
		for(int i=0;i<mapList.size();i++) {
			
			if(i == startLoc) {
				//System.out.println("[최종 시작 좌표] : " + mapList.get(startLoc).toString());
				startMap = mapList.get(startLoc);
			}
			
			if(i == endLoc) {
				//System.out.println("[최종 종료 좌표] : " + mapList.get(endLoc).toString());
				endMap = mapList.get(endLoc);
			}
			
		}

		// time 값 가져오기
		String startTimeS = startMap.get("time");
		String endTimeS = endMap.get("time");
		
		// System.out.println("[최종 시작 시간] : " + startTimeS);
		// System.out.println("[최종 종료 시간] : " + endTimeS);
		
		Date startTime = null;
		Date endTime = null;

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
		transFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
		try {
			startTime = transFormat.parse(startTimeS);
			endTime = transFormat.parse(endTimeS);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		// date 시간 차이 계산 이후 양식에 맞게 String값으로 변환
		long gur_time = (endTime.getTime() - startTime.getTime());
		
		List<TimeUnit> units = new ArrayList<TimeUnit>(EnumSet.allOf(TimeUnit.class));
     	Collections.reverse(units);
     	Map<TimeUnit,Long> result = new LinkedHashMap<TimeUnit,Long>();
     	long milliesRest = gur_time;
        for ( TimeUnit unit : units ) {
        	long diff = unit.convert(milliesRest,TimeUnit.MILLISECONDS);
        	long diffInMilliesForUnit = unit.toMillis(diff);
        	milliesRest = milliesRest - diffInMilliesForUnit;
            result.put(unit,diff);
        }
		
        String gur_timeS = "";
        
        if(result.get(TimeUnit.MINUTES) == 0) {
        	gur_timeS = Long.toString(result.get(TimeUnit.SECONDS));
        }
        else if(result.get(TimeUnit.HOURS) == 0) {
        	gur_timeS = Long.toString(result.get(TimeUnit.MINUTES)) + ":" + Long.toString(result.get(TimeUnit.SECONDS));
        }
        else if(result.get(TimeUnit.DAYS) == 0) {
        	gur_timeS = Long.toString(result.get(TimeUnit.HOURS)) + ":" + Long.toString(result.get(TimeUnit.MINUTES)) + ":" + Long.toString(result.get(TimeUnit.SECONDS));
        }
        else {
        	gur_timeS = Long.toString(result.get(TimeUnit.HOURS)) + ":" + Long.toString(result.get(TimeUnit.MINUTES)) + ":" + Long.toString(result.get(TimeUnit.SECONDS));
        }

        
		System.out.println("[최종 시작 시간 DATE ] : " + startTime);
		System.out.println("[최종 종료 시간 DATE ] : " + endTime);
		
		
		System.out.println(result.toString());
		System.out.println("[코스 소모 시간 ] : " + gur_timeS);
		
		
		
		
		
		return gur;
	}
}

