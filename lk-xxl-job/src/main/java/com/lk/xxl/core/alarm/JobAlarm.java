package com.lk.xxl.core.alarm;

import com.lk.xxl.domain.XxlJobInfo;
import com.lk.xxl.domain.XxlJobLog;

/**
 * @author xuxueli 2020-01-19
 */
public interface JobAlarm {

	/**
	 * job alarm
	 * @param info
	 * @param jobLog
	 * @return
	 */
	public boolean doAlarm(XxlJobInfo info, XxlJobLog jobLog);

}
