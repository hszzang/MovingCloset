package movingcloset.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import movingcloset.command.CommandImpl;
import mybatis.MemberDTO;
import mybatis.MoyoBusDTO;
import mybatis.MoyoDTO;
import mybatis.MoyoUseDTO;
import mybatis.MybatisAndroidImpl;

@Controller
public class AndroidController {

	CommandImpl command = null;
	
	@Autowired
	SqlSession sqlSession;

	// 안드로이드 로그인
	@RequestMapping(value = "/android/AndLogin.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> andLogin(HttpServletRequest req) {
		
		System.out.println("androidLogin 호출");
		System.out.println(req.getParameter("userid") + " / " + req.getParameter("userpass") + " / " + req.getParameter("logincate"));

		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		String loginCate = req.getParameter("logincate");
		
		if(loginCate.equals("member")) {
			
			MemberDTO memberDTO = sqlSession.getMapper(MybatisAndroidImpl.class)
					.androidLogin(req.getParameter("userid"), req.getParameter("userpass"));
			
			if(memberDTO == null) {
				//회원정보 불일치로 로그인에 실패한 경우.. 결과만 0으로 내려준다.
				returnMap.put("isLogin", 0);
			}
			else {
				//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다.
				returnMap.put("memberDTO", memberDTO);
				returnMap.put("isLogin", 1);
			}
		}
		else if(loginCate.equals("moyobus")) {
		
			MoyoBusDTO moyoBusDTO = sqlSession.getMapper(MybatisAndroidImpl.class)
					.androidMoyoBusLogin(req.getParameter("userid"), req.getParameter("userpass"));
			
			
			if(moyoBusDTO == null) {
				//회원정보 불일치로 로그인에 실패한 경우.. 결과만 0으로 내려준다.
				returnMap.put("isLogin", 0);
			}
			else {
				MoyoDTO moyoDTO = sqlSession.getMapper(MybatisAndroidImpl.class)
						.andGetMoyoInfo(moyoBusDTO.getM_idx());
				
				//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다.
				returnMap.put("isLogin", 1);
				returnMap.put("moyoBusDTO", moyoBusDTO);
				returnMap.put("moyoDTO", moyoDTO);
			}
		}
		else {
			returnMap.put("isLogin", 0);
		}
		
		return returnMap;
	}

	// 안드로이드 모여목록 불러오기(위치기반)
	@RequestMapping(value = "/android/AndMoyoList.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> andMoyoList(HttpServletRequest req) {
		
		System.out.println("AndMoyoList 호출");
		System.out.println("요청된 중심 위도/경도" + req.getParameter("latitude") + " / " + req.getParameter("longitude"));
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		ArrayList<MoyoDTO> moyoList = sqlSession.getMapper(MybatisAndroidImpl.class)
				.andGetMoyoList(req.getParameter("latitude"), req.getParameter("longitude"));
		
		if(moyoList == null) {
			//회원정보 불일치로 로그인에 실패한 경우.. 결과만 0으로 내려준다.
			returnMap.put("isMoyo", 0);
		}
		else {
			//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다.
			returnMap.put("moyoList", moyoList);
			returnMap.put("isMoyo", moyoList.size());
		}
		
		return returnMap;
	}
	
	// 안드로이드 내 모여목록 가져오기
	@RequestMapping(value = "/android/AndMyMoyoList.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> andMyMoyoList(HttpServletRequest req) {
		
		System.out.println("AndMyMoyoList 호출");
		String loginID = req.getParameter("userid");
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		ArrayList<MoyoDTO> myMoyoList = sqlSession.getMapper(MybatisAndroidImpl.class)
				.andGetMyMoyoList(loginID);
		
		if(myMoyoList == null) {
			returnMap.put("isMoyo", 0);
		}
		else {
//			System.out.println(myMoyoList);
			
			ArrayList<MoyoUseDTO> myMoyoInfo = new ArrayList<MoyoUseDTO>();
			for(MoyoDTO m : myMoyoList) {
				myMoyoInfo.add(sqlSession
						.getMapper(MybatisAndroidImpl.class).andGetMyMoyoInfo(m.getM_idx(), loginID));
			}
			
			returnMap.put("myMoyoList", myMoyoList);
			returnMap.put("myMoyoInfo", myMoyoInfo);
			returnMap.put("isMoyo", myMoyoList.size());
		}
		
		return returnMap;
	}
	
	// 안드로이드 모여버스 위치 가져오기(안드에서 DB로)
	@RequestMapping(value = "/android/AndMoyoBusLocation.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> andMoyoBusLocation(HttpServletRequest req) {
		
		System.out.println("AndMoyoBusLocation 호출");
		String latitude = req.getParameter("latitude");
		String longitude = req.getParameter("longitude");
		String mb_addr = req.getParameter("mb_addr");
		String mb_status = req.getParameter("mb_status");
		String busid = req.getParameter("busid");
		
		//안드로이드에서 가져온 정보로 moyo_bus 테이블의 위도, 경도, 주소를 업데이트
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = sqlSession.getMapper(MybatisAndroidImpl.class)
				.andUpdateMoyoBus(latitude, longitude, mb_addr, mb_status, busid);
		
		returnMap.put("isMoyoBus", result);
		
		return returnMap;
	}
	
	//안드로이드 모여버스 위치 얻어오기(DB에서 안드로)
	@RequestMapping(value = "/android/AndMyBusLoca.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> andMyBusLoca(HttpServletRequest req) {
		
		System.out.println("AndMyBusLoca 호출");
		String m_idx = req.getParameter("m_idx");
		
		//안드로이드에서 가져온 정보로 moyo_bus 테이블의 위도, 경도, 주소를 업데이트
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		MoyoBusDTO moyoBusDTO = sqlSession.getMapper(MybatisAndroidImpl.class)
				.andGetMoyoBus(m_idx);
		
		if(moyoBusDTO != null) {
			returnMap.put("isMoyoBus", 1);
			returnMap.put("moyoBusDTO", moyoBusDTO);
		}
		else {
			returnMap.put("isMoyoBus", 0);
		}
		
		return returnMap;
	}
	

}
