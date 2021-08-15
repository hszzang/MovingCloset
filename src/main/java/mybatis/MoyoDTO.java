package mybatis;

import lombok.Data;

@Data
public class MoyoDTO {
	
	private String m_idx;
	private String m_name;
	private String m_addr;
	private String m_lat;
	private String m_lon;
	private String m_goal;
	private java.sql.Date m_dday;
	private String m_desc;
	private java.sql.Date m_start;
	private java.sql.Date m_end;
    private String m_status;
    private String m_ofile;
    private String m_sfile;
	
}
