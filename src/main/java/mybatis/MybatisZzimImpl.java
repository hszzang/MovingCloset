package mybatis;

import java.util.ArrayList;
import java.util.List;

public interface MybatisZzimImpl {
 
	public ArrayList<ZzimDTO> getZzimList(ZzimDTO zzimDTO);
	
	public void zzimListRemove(ZzimDTO zzimDTO);
	
	public void zzimListCreate(ZzimDTO zzimDTO);
	
	public ArrayList<ZzimDTO> zzimAllList(ZzimDTO zzimDTO);
	
	public List<ZzimDTO> AllZzimList();
}
