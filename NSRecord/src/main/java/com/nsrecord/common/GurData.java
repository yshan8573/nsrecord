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

	public static List<GurDto> read(String path, GpxDto gpx, List<GrcDto> grcList) {
		
		// 저장된 gpx 파일 가져오기
		String gpxFile = gpx.getG_re();
		List<Map> mapList = GpxReader.read(path, gpxFile);
		

		// grc 리스트 검색 후 일치하는 gpx 코스 찾기
		GrcDto grc = null;
		
		// gpx값 좌표 변수 선언
		String gpxLatS = "";
		String gpxLonS = "";
		
		// gpx 기준 시작,종료 좌표 변수 선언
		String startLocMap = "";
		String endLocMap = "";
		
		// grc gpx 비교시 일치 되었을 때 담는 리스트
		List<HashMap<String,String>> grcMapList = new ArrayList<HashMap<String,String>>();
		
		// grc 리스트
		for(int j=0;j<grcList.size();j++) {
			
			grc = grcList.get(j);
			
			// grc 시작 좌표 구하기
			String[] grcStart =  grc.getGrc_start().split(",");
			double startLat = Double.parseDouble(grcStart[0]);
			double startLon = Double.parseDouble(grcStart[1]);
			
			double startLatIf = Math.floor(startLat*1000);
			double startLonIf = Math.floor(startLon*1000);
			
			// 좌표값 콘솔 출력
//			System.out.println("grcLatIf : " + grcLatIf);
//			System.out.println("grcLonIf : " + grcLonIf);

			// grc 종료 좌표 구하기
			String[] grcEnd =  grc.getGrc_end().split(",");
			double endLat = Double.parseDouble(grcEnd[0]);
			double endLon = Double.parseDouble(grcEnd[1]);
			
			double endLatIf = Math.floor(endLat*1000);
			double endLonIf = Math.floor(endLon*1000);
			
			// 좌표값 콘솔 출력
//			System.out.println("grcLatIf : " + grcLatIf);
//			System.out.println("grcLonIf : " + grcLonIf);
					
		
			HashMap<String,String> gpxMap = new HashMap<String,String>();
			
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
				
				// 시작 좌표와 일치하는 값 찾기
				if(gpxLatIf == startLatIf && gpxLonIf == startLonIf) {
					// 일치 되는 값만 모으기
					//System.out.println("[시작 좌표] grcList : " + grcList.get(j).getGrc_title() + " || gpxLat : " + gpxLat + " || gpxLon : " + gpxLon);
					
					startLocMap += i + ",";
					
				}
				
				// 종료 좌표와 일치하는 값 찾기
				if(gpxLatIf == endLatIf && gpxLonIf == endLonIf) {
					
					// 일치 되는 값만 모으기
					//System.out.println("[종료 좌표] grcList : " + grcList.get(j).getGrc_title() + " || gpxLat : " + gpxLat + " || gpxLon : " + gpxLon);
					
					endLocMap += i + ",";
				}

			}
			
			if(!startLocMap.equals("")) {
				// grc gpx 두 경로가 일치하는 값이 있으면 grcMapList에 담기
				gpxMap.put("grcSeq", Integer.toString(grcList.get(j).getGrc_seq()));
				gpxMap.put("startLocS", startLocMap);
				gpxMap.put("endLocS", endLocMap);
				grcMapList.add(gpxMap);
			}
			
			
			// 새로운 값을 받기 위한 변수 초기화
			startLocMap = "";
			endLocMap = "";
			
			
		}
		
		
		// gpx 기준 시작,종료 좌표 변수 변환
		
		// start, end 좌표 변환에 필요한 변수들
		String startLocS = "";
		String endLocS = "";
		String[] startLocSArr = null;
		String[] endLocSArr = null;
		int startLoc = 0;
		int endLoc = 0;
		
		// 시간 계산에 필요한 변수들
		long gur_time = 0;
		String gur_times = "";
		
		// 코스별 gur값을 넣기 위한 변수
		List<GurDto> gurList = new ArrayList<GurDto>();
		
		for(int i=0;i<grcMapList.size();i++) {
			
			startLocS = grcMapList.get(i).get("startLocS");
			endLocS = grcMapList.get(i).get("endLocS");
			
			startLocS = startLocS.substring(0, startLocS.length()-1);
			endLocS = endLocS.substring(0, endLocS.length()-1);
			
			startLocSArr = startLocS.split(",");
			endLocSArr = endLocS.split(",");
			
			startLoc = Integer.parseInt(startLocSArr[Math.round(startLocSArr.length/2)]);
			endLoc = Integer.parseInt(endLocSArr[Math.round(endLocSArr.length/2)]);
			
			Map<String,String> startMap = new HashMap<String,String>();
			Map<String,String> endMap = new HashMap<String,String>();
			for(int j=0;j<mapList.size();j++) {
				
				if(j == startLoc) {
					//System.out.println("[최종 시작 좌표] : " + mapList.get(startLoc).toString());
					startMap = mapList.get(startLoc);
				}
				
				if(j == endLoc) {
					//System.out.println("[최종 종료 좌표] : " + mapList.get(endLoc).toString());
					endMap = mapList.get(endLoc);
				}
				
			}
			
			// time 값 가져오기
			String startTimeS = startMap.get("time");
			String endTimeS = endMap.get("time");
			
			// System.out.println("[최종 시작 시간] : " + startTimeS);
			// System.out.println("[최종 종료 시간] : " + endTimeS);
			
			gur_time = timeCal(startTimeS,endTimeS);
			gur_times = timeString(gur_time);
			
			
			GurDto gur = new GurDto();
			
			// gur에 gpx 정보 저장
			gur.setU_seq(gpx.getU_seq());
			gur.setGrc_seq(Integer.parseInt(grcMapList.get(i).get("grcSeq")));
			gur.setGur_time(gur_time);
			gur.setGur_times(gur_times);
			
			gurList.add(gur);
			
			System.out.println("grcSeq [" + gur.getGrc_seq() + "] 코스 [소요 시간] : " + gur.getGur_times());
			
		}

		return gurList;
	}

	// 시간 차이 계산
	public static long timeCal(String startTimeS, String endTimeS) {
		
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
		
		// date 시간 차이 계산
		long gur_time = (endTime.getTime() - startTime.getTime());
		
//		System.out.println("[최종 시작 시간 DATE ] : " + startTime);
//		System.out.println("[최종 종료 시간 DATE ] : " + endTime);
		
		
		return gur_time; 
	}
	
	// long 타입 시간 값 string으로 변환
	private static String timeString(long gur_time) {
		
		String gur_times = "";

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
        
//        System.out.println(result.toString());
        
        String seconds = Long.toString(result.get(TimeUnit.SECONDS));
        String minutes = Long.toString(result.get(TimeUnit.MINUTES));
        String hours = Long.toString(result.get(TimeUnit.HOURS));
        String days = Long.toString(result.get(TimeUnit.DAYS));
        
        if(seconds.length() == 1) {seconds = "0" + seconds;}
        if(minutes.length() == 1) {seconds = "0" + minutes;}
        if(hours.length() == 1) {seconds = "0" + hours;}
        
        if(result.get(TimeUnit.MINUTES) == 0) {
        	gur_times = seconds;
        }
        else if(result.get(TimeUnit.HOURS) == 0) {
        	gur_times = minutes + ":" + seconds;
        }
        else if(result.get(TimeUnit.DAYS) == 0) {
        	gur_times = hours + ":" + minutes + ":" + seconds;
        }
        else {
        	gur_times = days + ":" + hours + ":" + minutes + ":" + seconds;
        }
        
		return gur_times;
	}

}

