-- ������ʾͳ�ƻ����
-- dengxx

-- �ű���
x800120_g_ScriptId	= 800120

x800120_g_actList = {
			[1]= {min=10,max =160,},--name="˫�����飨ʣ�ࣩ",prog="Сʱ",},
			[2]= {min=10,max =19,},--name="ʦ�����񣨸߽�����",prog="/10��",},
			[3]= {min=20,max =39,},--name="ʦ�����񣨸߽�����",prog="/15��",},
			[4]= {min=40,max =74,},--name="ʦ�����񣨸߽�����",prog="/20��",},
			[5]= {min=10,max =74,},--name="�ƾٴ���",prog="/1��",},
			[6]= {min=10,max =160,},--name="�������",prog="/1��",},
			[7]= {min=75,max =160,},--name="¥��Ѱ��",prog="/1��",},
			[8]= {min=30,max =160,},--name="һ����������",prog="/5��",},
			[9]= {min=75,max =160,},--name="�ƽ�֮��",prog="/5��",},
			[10]={min=75,max =160,},--name="��ս��翷壨���ѣ�",prog="��",},
			[11]={min=20,max =160,},--name="���˿����",prog="/1��",},	
			[12]={min=30,max =160,},--name="���������",prog="/1��",},
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
			if i == 1 then  --˫��ʱ��
				local nDECount = DEGetCount(sceneId, selfId)
			  tempData[i].nCount = nDECount
			elseif i == 2 or i == 3 or i == 4 then  --ʦ��
				local iDayCount=GetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT)
				local iTime = GetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME)
				local iDayTime = floor(iTime/100)	--��һ�η��������ʱ��(����)
				local CurTime = GetQuarterTime()		--��ǰʱ��
				local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
				local iDayHuan = 0	
				if CurDaytime == iDayTime then 	--�ϴ����������ͬһ��
					iDayHuan = iDayCount
			  end
			  tempData[i].nCount = iDayHuan
			elseif i == 5 then --�ƾ�
				if 1 == GetMissionData(sceneId, selfId, MD_EXAM_FEE_FLAG) then
	      	local StartTime = GetMissionData(sceneId,selfId,MD_EXAM_STARTTIME) --�ƾ�ʱ��
	      	local CurrentTime = LuaFnGetCurrentTime()                          --��ǰʱ��
	        local ntime = CurrentTime - StartTime
	        local CurTime = GetQuarterTime()								--��ǰʱ��
		      local CurQuarterTime = mod( CurTime, 100 )	--��ǰʱ��(��)
	        --�жϽ����Ƿ�μ��˿ƾ�:��ǰʱ��Ϊ17:30֮��,��û�й�0�� 23400=6.5*60*60
	        if CurQuarterTime >= 70 and  ntime <= 23400 then
	        	tempData[i].nCount = 1
	        end
	      end
      elseif i == 6 then --�������
      	if GetMissionData(sceneId, selfId, MD_LAST_QIJU_DAY) == GetDayTime() then
      		tempData[i].nCount = 1
      	end
      elseif i == 7 then --¥��Ѱ��
      	if GetMissionData(sceneId, selfId, MD_SEEK_TREASURE) == GetTime2Day() then
      		tempData[i].nCount = 1
      	end
      elseif i == 8 then --һ����������
	      local DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES )
		    local CurDate = mod( DayTimes, 100000 )
		    local takenTimes = floor( DayTimes/100000 )
		    if GetDayTime() == CurDate then
		    	 tempData[i].nCount = takenTimes
		    end
		  elseif i == 9 then --�ƽ�֮��
		  	local DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME )
		  	local CurDate = mod( DayTimes, 100000 )
		    local takenTimes = floor( DayTimes/100000 )
		    if GetDayTime() == CurDate then
		    	 tempData[i].nCount = takenTimes
		    end
		  elseif i == 10 then --��ս��翷� = ��翷� + ����������ս����
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
			elseif i == 11 then --���˿����
				if GetDayTime() == GetMissionData(sceneId, selfId, MD_XINGYUN_TIME_INFO) then
					tempData[i].nCount = 1
				end
			elseif i == 12 then --����� ��½�޷����й�Ҫ��
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


