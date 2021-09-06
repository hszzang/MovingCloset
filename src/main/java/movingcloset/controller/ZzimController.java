package movingcloset.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import movingcloset.command.CommandImpl2;
import movingcloset.command.zzim.ZzimAllListCommand;
import movingcloset.command.zzim.ZzimCreateCommand;
import movingcloset.command.zzim.ZzimListCommand;
import movingcloset.command.zzim.ZzimRemoveCommand;
import mybatis.ZzimDTO;

@Controller
public class ZzimController {
	
	CommandImpl2 command = null;
	
	@Autowired
	ZzimListCommand zzimListCommand;
	 
	@Autowired
	ZzimRemoveCommand zzimRemoveCommand;
	
	@Autowired
	ZzimCreateCommand zzimCreateCommand;
	
	@ResponseBody
	@RequestMapping(value = "/zzimList", method = RequestMethod.POST)
	public ArrayList<ZzimDTO> zzimList(ZzimDTO zzimDTO) {
		
		System.out.println("zzimList호출");
		
		System.out.println(zzimDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("zzimDTO", zzimDTO);
		command = zzimListCommand;
		command.mapexecute(map);
		ArrayList<ZzimDTO> zzimList = (ArrayList<ZzimDTO>) map.get("zzimList");
		System.out.println("찜리스트출력 : "+zzimList);
		return zzimList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/zzimremove", method = RequestMethod.POST)
	public void zzimRemove(ZzimDTO zzimDTO) {
		
		System.out.println("zzimremove호출");
		System.out.println(zzimDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("zzimDTO", zzimDTO);
		command = zzimRemoveCommand;
		command.mapexecute(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/zzimcreate", method = RequestMethod.POST)
	public ArrayList<String> zzimCreate(ZzimDTO zzimDTO) {
		
		System.out.println("zzimcreate호출");
		System.out.println(zzimDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("zzimDTO", zzimDTO);
		command = zzimCreateCommand;
		command.mapexecute(map);
		
		String userid = zzimDTO.getUserid();
		String p_code = zzimDTO.getP_code();
		
		ArrayList<String> zzimList = new ArrayList<String>();
		
		zzimList.add(userid);
		zzimList.add(p_code);
		
		System.out.println("카트리스트출력"+zzimList);
		return zzimList;
	}
		
}
