-- 下线提示统计活动功能
-- dengxx

-- 脚本号
x800120_g_ScriptId	= 800120

x800120_g_actList = {
			[1]= {min=10,max =160,},--name="双倍经验（剩余）",prog="小时",},
			[2]= {min=10,max =19,},--name="师门任务（高奖励）",prog="/10环",},
			[3]= {min=20,max =39,},--name="师门任务（高奖励）",prog="/15环",},
			[4]= {min=40,max =74,},--name="师门任务（高奖励）",prog="/20环",},
			[5]= {min=10,max =74,},--name="科举答题",prog="/1次",},
			[6]= {min=10,max =160,},--name="珍珑棋局",prog="/1次",},
			[7]= {min=75,max =160,},--name="楼兰寻宝",prog="/1次",},
			[8]= {min=30,max =160,},--name="一个都不能跑",prog="/5次",},
			[9]= {min=75,max =160,},--name="黄金之链",prog="/5次",},
			[10]={min=75,max =160,},--name="初战缥缈峰（较难）",prog="次",},
			[11]={min=20,max =160,},--name="幸运快活三",prog="/1次",},	
			[12]={min=30,max =160,},--name="寒玉谷修行",prog="/1次",},
		}

function x800120_AuditGameProgess(sceneId,selfId)
	
	
	local level = GetLevel(sceneId,selfId)
	local tempData={
		[1]={nCount=0,bShow=0},
		[2]={nCount=0,bShow=0},
		[3]={nCount=0,bShow=0},
		[4]={nCount=0,bShow=0},
		[5]={nCount=0,bShow=0},
		[6]={nCount=0,bShow=0},
		[7]={nCount=0,bShow=0},
		[8]={nCount=0,bShow=0},
		[9]={nCount=0,bShow=0},
		[10]={nCount=0,bShow=0},
		[11]={nCount=0,bShow=0},
		[12]={nCount=0,bShow=0},
	}	
	
	for i,act in x800120_g_actList do	

		if level >= act.min and level <= act.max then
			tempData[i].bShow = 1
			--beginif
			if i == 1 then  --双倍时间
				local nDECount = DEGetCount(sceneId, selfId)
			  tempData[i].nCount = nDECount
			elseif i == 2 or i == 3 or i == 4 then  --师门
				local iDayCount=GetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT)
				local iTime = GetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME)
				local iDayTime = floor(iTime/100)	--上一次放弃任务的时间(天数)
				local CurTime = GetQuarterTime()		--当前时间
				local CurDaytime = floor(CurTime/100)	--当前时间(天)
				local iDayHuan = 0	
				if CurDaytime == iDayTime then 	--上次完成任务是同一天
					iDayHuan = iDayCount
			  end
			  tempData[i].nCount = iDayHuan
			elseif i == 5 then --科举
				if 1 == GetMissionData(sceneId, selfId, MD_EXAM_FEE_FLAG) then
	      	local StartTime = GetMissionData(sceneId,selfId,MD_EXAM_STARTTIME) --科举时间
	      	local CurrentTime = LuaFnGetCurrentTime()                          --当前时间
	        local ntime = CurrentTime - StartTime
	        local CurTime = GetQuarterTime()								--当前时间
		      local CurQuarterTime = mod( CurTime, 100 )	--当前时间(刻)
	        --判断今天是否参加了科举:当前时间为17:30之后,且没有过0点 23400=6.5*60*60
	        if CurQuarterTime >= 70 and  ntime <= 23400 then
	        	tempData[i].nCount = 1
	        end
	      end
      elseif i == 6 then --珍珑棋局
      	if GetMissionData(sceneId, selfId, MD_LAST_QIJU_DAY) == GetDayTime() then
      		tempData[i].nCount = 1
      	end
      elseif i == 7 then --楼兰寻宝
      	if GetMissionData(sceneId, selfId, MD_SEEK_TREASURE) == GetTime2Day() then
      		tempData[i].nCount = 1
      	end
      elseif i == 8 then --一个都不能跑
	      local DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES )
		    local CurDate = mod( DayTimes, 100000 )
		    local takenTimes = floor( DayTimes/100000 )
		    if GetDayTime() == CurDate then
		    	 tempData[i].nCount = takenTimes
		    end
		  elseif i == 9 then --黄金之链
		  	local DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME )
		  	local CurDate = mod( DayTimes, 100000 )
		    local takenTimes = floor( DayTimes/100000 )
		    if GetDayTime() == CurDate then
		    	 tempData[i].nCount = takenTimes
		    end
		  elseif i == 10 then --初战缥缈峰 = 缥缈峰 + 今天重置挑战次数
		  	local lastTime = GetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_SMALL_LASTTIME )
				local lastDayTime = floor( lastTime / 100 )
				local lastDayCount = mod( lastTime, 100 )
				if  GetDayTime() == lastDayTime then
					tempData[i].nCount = lastDayCount
				end
				
				lastTime = GetMissionData( sceneId, selfId, MD_RESET_PMFSMALL_COUNT_LASTTIME )
	      lastDayTime = floor( lastTime / 100 )
	      lastDayCount = mod( lastTime, 100 )
	      if  GetDayTime() == lastDayTime then
	      	tempData[i].nCount = tempData[i].nCount + lastDayCount
	      end
			elseif i == 11 then --幸运快活三
				if GetDayTime() == GetMissionData(sceneId, selfId, MD_XINGYUN_TIME_INFO) then
					tempData[i].nCount = 1
				end
			elseif i == 12 then --寒玉谷 大陆无夫妻行功要诀
				if GetDayTime() == GetMissionData(sceneId, selfId, MD_HANYUBED_USEBOOK_LASTDAY) then
				  tempData[i].nCount = 1
				end
			end
			--endif
		end
	end--endfor

	BeginUICommand(sceneId)
	for i,data in tempData do
	  if data.bShow == 1 then
	  	 UICommand_AddInt(sceneId,data.nCount)
	  end
	end
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 800120)
  
end


