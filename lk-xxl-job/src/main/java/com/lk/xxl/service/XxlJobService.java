package com.lk.xxl.service;

import com.lk.xxl.domain.XxlJobGroup;
import com.lk.xxl.domain.XxlJobInfo;
import com.xxl.job.core.biz.model.ReturnT;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * core job action for xxl-job
 *
 * @author xuxueli 2016-5-28 15:30:33
 */
public interface XxlJobService {

	public int changeGroup(XxlJobInfo jobInfo);

	public List<XxlJobInfo> selectJobInfoList();

	/**
	 * page list
	 * @param start
	 * @param length
	 * @return
	 */
	public Map<String, Object> pageList(int start, int length); //, int jobGroup, int triggerStatus, String jobDesc,String executorHandler, String author

	/**
	 * add job
	 * @param jobInfo
	 * @return
	 */
	public ReturnT<String> add(XxlJobInfo jobInfo);

	/**
	 * update job
	 * @param jobInfo
	 * @return
	 */
	public ReturnT<String> update(XxlJobInfo jobInfo);

	/**
	 * remove job *
	 * @param id
	 * @return
	 */
	public ReturnT<String> remove(int id);

	/**
	 * start job
	 * @param id
	 * @return
	 */
	public ReturnT<String> start(int id);

	/**
	 * stop job
	 * @param id
	 * @return
	 */
	public ReturnT<String> stop(int id);

	/**
	 * dashboard info
	 * @return
	 */
	public Map<String, Object> dashboardInfo();

	/**
	 * chart info
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public ReturnT<Map<String, Object>> chartInfo(Date startDate, Date endDate);

}
