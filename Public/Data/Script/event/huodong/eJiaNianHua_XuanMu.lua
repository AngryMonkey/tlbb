--����Ǯ�� 
--�������껪-��תľ�� Created by DengXX

x889054_g_ScriptId = 889054


x889054_g_isDone = {}
x889054_g_isDone[0]="#{J_XZMM_090318_17}"
x889054_g_isDone[1]="#{J_XZMM_090318_16}"

x889054_g_XuanMuJingDanId = 30504073 --��ľ�� �߼����� 
x889054_g_XuanMuYingDanId = 30504074 --��ľ���� ��������
x889054_g_PiaoMiaoFengItemId = 30504075 --����ʯID 
x889054_g_XuanMu_Base        = "XUANMU_BASE"    --ͳ����־�á���ȡ��������
x889054_g_XuanMu_Advance     = "XUANMU_ADVANCE" --ͳ����־��  ��ȡ�߼�����                             
x889054_g_StartDate = 9097  --20090408
x889054_g_EndDate = 9131    --20090512
x889054_g_CancelDate = 9150    --20090531 �ر�ѡ��
--**********************************
--�¼��������
--**********************************
function x889054_OnEnumerate( sceneId, selfId,targetId )
	if GetDayTime() >= x889054_g_StartDate and GetDayTime() <= x889054_g_CancelDate then
    AddNumText(sceneId,x889054_g_ScriptId,"#{J_XZMM_090318_1}",6,0)
  end 
end

function x889054_OnDefaultEvent( sceneId,selfId,targetId )
	
	local key = GetNumText()
	
	if key == 0 or key ==30 then --���"��תľ��"��"��һҳ"
		BeginEvent(sceneId)
		  AddText(sceneId,"#{J_XZMM_090318_2}")
			if GetDayTime() >= x889054_g_StartDate and  GetDayTime() <= x889054_g_EndDate then 
				AddNumText(sceneId,x889054_g_ScriptId,"#{J_XZMM_090318_3}",6,1)
        AddNumText(sceneId,x889054_g_ScriptId,"#{J_XZMM_090318_4}",6,2)
      end
      AddNumText(sceneId,x889054_g_ScriptId,"#{J_XZMM_090318_5}",11,99)
    DispatchEventList(sceneId,selfId,targetId)
  end
  
  if key == 1  then 
  	 local Message = {
											[1]="#{J_XZMM_090318_9}",
										  [2]="#{J_XZMM_090318_10}",
										  [3]="#{J_XZMM_090318_11}",
										  [4]="#{J_XZMM_090318_12}",
										  [5]="#{J_XZMM_090318_13}"
										 }
     local flag = x889054_AuditHuoDong(sceneId,selfId,targetId,1)
      --��ʾͳ����Ϣ
    	local msg = format("#{J_XZMM_090318_8}")
      BeginEvent( sceneId )
        AddText( sceneId, msg )
	      for i=1,5 do
	      	msg =format(Message[i]..x889054_g_isDone[flag[i]])
			    AddText( sceneId, msg )
	      end
	      AddText( sceneId, "#{J_XZMM_090318_25}" )
        AddNumText(sceneId,x889054_g_ScriptId,"#{INTERFACE_XML_1058}",6,10)
        AddNumText(sceneId,x889054_g_ScriptId,"#{INTERFACE_XML_1060}",6,30)
      EndEvent( sceneId )
      DispatchEventList( sceneId, selfId, targetId )	
  end
  
    
  if key == 2  then 
  	 local Message = {
											[1]="#{J_XZMM_090318_9}",
										  [2]="#{J_XZMM_090318_10}",
										  [3]="#{J_XZMM_090318_18}",
										  [4]="#{J_XZMM_090318_19}",
										  [5]="#{J_XZMM_090318_13}",
										  [6]="#{J_XZMM_090318_20}",
										  [7]="#{J_XZMM_090318_21}"
										 }
     local flag = x889054_AuditHuoDong(sceneId,selfId,targetId,2)
    	--��ʾͳ����Ϣ
    	local msg = format("#{J_XZMM_090318_8}")
      BeginEvent( sceneId )
        AddText( sceneId, msg )
	      for i=1,7 do
	      	msg =format(Message[i]..x889054_g_isDone[flag[i]])
			    AddText( sceneId, msg )
	      end
	      AddText( sceneId, "#{J_XZMM_090318_25}" )
	      AddNumText(sceneId,x889054_g_ScriptId,"#{INTERFACE_XML_1058}",6,20)
        AddNumText(sceneId,x889054_g_ScriptId,"#{INTERFACE_XML_1060}",6,30)
      EndEvent( sceneId )
      DispatchEventList( sceneId, selfId, targetId )  	
  end
  
  if key == 10 then
   
    --�жϵ����Ƿ���ȡ������
    local today = GetDayTime()
  	if today == GetMissionData(sceneId, selfId, MD_TW_JIANIANHUA_XUANMU_DATE) then 
	     BeginEvent( sceneId )
  	       AddText( sceneId, "#{J_XZMM_090318_6}" )
  	   EndEvent( sceneId )
       DispatchEventList( sceneId, selfId, targetId )
	     return
  	end
  	
    local flag = x889054_AuditHuoDong(sceneId,selfId,targetId,1)
    
    local nCount = 0
    for i=1,5 do
    	nCount =nCount + flag[i]
    end
    local msg =""
    if nCount >= 4 then   	       
	      	  
    	 local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
    	 if FreeSpace == 0 then 
	    		x889054_ShowTip( sceneId, selfId, "#{J_XZMM_090318_7}" )
	    	  return
    	 end  
	     --���㽱Ʒ
	     local ret = TryRecieveItem( sceneId, selfId, x889054_g_XuanMuYingDanId, QUALITY_MUST_BE_CHANGE)
	     if ret >=0 then 
		    --���û��ǡ���־ͳ��
		       SetMissionData(sceneId,selfId,MD_TW_JIANIANHUA_XUANMU_DATE,today)
		       LuaFnAuditQuest(sceneId,selfId,x889054_g_XuanMu_Base)
		       --��Ʒ��Ŀ��ʾ
		       x889054_ShowTip( sceneId, selfId, "#{QRJ_81009_26}"..GetItemName(sceneId,x889054_g_XuanMuYingDanId))
	         Msg2Player(sceneId, selfId, "#{QRJ_81009_26}"..GetItemName(sceneId,x889054_g_XuanMuYingDanId), MSG2PLAYER_PARA )
	     end
	     msg = format("#{J_XZMM_090318_14}")
	   else
	   	 msg = format("#{J_XZMM_090318_15}")
	   end
	   
	   BeginEvent( sceneId )
  	   AddText( sceneId, msg )
  	 EndEvent( sceneId )
     DispatchEventList( sceneId, selfId, targetId )
     
  end
  
 
  if key == 20 then
  	
     --�жϵ����Ƿ���ȡ������	       
     local today = GetDayTime()
	   if today == GetMissionData(sceneId, selfId, MD_TW_JIANIANHUA_XUANMU_DATE) then 
    	  BeginEvent( sceneId )
  	       AddText( sceneId, "#{J_XZMM_090318_6}" )
  	    EndEvent( sceneId )
        DispatchEventList( sceneId, selfId, targetId )
    	  return
	   end
  	 
  	 local flag = x889054_AuditHuoDong(sceneId,selfId,targetId,2)
     local nCount = 0
     for i=1,7 do
    	 nCount =nCount + flag[i]
     end
     local msg ="" 
     
     if nCount >=5 and flag[7]==1 then
    	 
    	 local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
    	 if FreeSpace == 0 then 
	    		x889054_ShowTip( sceneId, selfId, "#{J_XZMM_090318_7}" )
	    	  return
    	 end  
    	 
        --�۳�����ʯ
        if LuaFnGetAvailableItemCount(sceneId,selfId,x889054_g_PiaoMiaoFengItemId) >= 1 then
        	if LuaFnDelAvailableItem(sceneId,selfId,x889054_g_PiaoMiaoFengItemId,1) > 0 then  
	           local ret = TryRecieveItem( sceneId, selfId, x889054_g_XuanMuJingDanId, QUALITY_MUST_BE_CHANGE)
	           if ret >=0 then 
	           --���û��ǡ���־ͳ��
	              SetMissionData(sceneId,selfId,MD_TW_JIANIANHUA_XUANMU_DATE,today)
	              LuaFnAuditQuest(sceneId,selfId,x889054_g_XuanMu_Advance)
	               --��Ʒ��Ŀ��ʾ
			          x889054_ShowTip( sceneId, selfId, "#{QRJ_81009_26}"..GetItemName(sceneId,x889054_g_XuanMuJingDanId))
		            Msg2Player(sceneId, selfId, "#{QRJ_81009_26}"..GetItemName(sceneId,x889054_g_XuanMuJingDanId), MSG2PLAYER_PARA )
		            --ϵͳ����
		            local BagIndex = GetBagPosByItemSn(sceneId, selfId,x889054_g_XuanMuJingDanId)
		            local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
		            local str = format("#{J_ZDGG_090331_1}#{_INFOMSG%s}#{J_ZDGG_090331_2}#{_INFOUSR%s}#{J_ZDGG_090331_3}",ItemInfo,GetName(sceneId,selfId))
	              BroadMsgByChatPipe(sceneId, selfId, str, 4)
	           end
	         end
         end 
         msg = format("#{J_XZMM_090318_22}")
	   else
	   	   msg = format("#{J_XZMM_090318_24}")
	   end  
	   
	   BeginEvent( sceneId )
  	   AddText( sceneId, msg )
  	 EndEvent( sceneId )
     DispatchEventList( sceneId, selfId, targetId )
  end
  
  if key == 99 then
  	 BeginEvent( sceneId )
  	   AddText( sceneId, "#{J_XZMM_090318_23}" )
  	 EndEvent( sceneId )
     DispatchEventList( sceneId, selfId, targetId )
  end
  	   
end

function x889054_AuditHuoDong(sceneId,selfId,targetId,nType)
  --nType: 1-�����ͳ��  2 - �߼��ͳ��
  
	if nType == 1 then	  
	    local flag={[1]=0,[2]=0,[3]=0,[4]=0,[5]=0}
	    local today = GetDayTime()
	   --���˿����
    	if today == GetMissionData(sceneId, selfId, MD_XINGYUN_TIME_INFO) then 
    		flag[1] = 1
    	end
    	
      --���    	
    	if today == GetMissionData(sceneId, selfId, MD_LAST_QIJU_DAY) then 
        flag[2] = 1
    	end
    	
      --ʦ��10��
      local iDayCount=GetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT)
      local iTime = mod(iDayCount,100000)
      local iDayTime = floor(iTime/100)	--��һ�η��������ʱ��(����)
      local iDayHuan = floor(iDayCount/100000) --��������ɵ��������
      local CurTime = GetHourTime()		--��ǰʱ��
	    local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
      
      if iDayTime == CurDaytime and 10 <= iDayHuan then 
        flag[3] = 1
    	end
    	
      --�ƾٴ��10��
      if 1 == GetMissionData(sceneId, selfId, MD_EXAM_FEE_FLAG) then
      	local StartTime = GetMissionData(sceneId,selfId,MD_EXAM_STARTTIME) --�ƾ�ʱ��
      	local CurrentTime = LuaFnGetCurrentTime()                          --��ǰʱ��
        local ntime = CurrentTime - StartTime
        local CurTime = GetHourTime()								--��ǰʱ��
	      local CurQuarterTime = mod( CurTime, 100 )	--��ǰʱ��(��)
        --�ж��Ƿ��ǵ���Ŀƾ�:��ǰʱ��Ϊ17:30֮��,��û�й�0�� 23400=6.5*60*60
        if CurQuarterTime >= 70 and  ntime <= 23400 then  
      		local times = GetMissionData(sceneId,selfId,MD_EXAM_SEQUENCE)
					local Question_Sequence_Before = floor(times/100)
					local Question_Sequence = mod(Question_Sequence_Before,10)
					local Examinator_Sequence = floor(Question_Sequence_Before/10) 
					
					if 1 <= Examinator_Sequence then
            flag[4] = 1
    		  end
    		 end
    	 end
    	
      --����
      if today == GetMissionData(sceneId, selfId, MD_HANYUBED_USEBOOK_LASTDAY) or today == GetMissionData(sceneId, selfId, MD_TW_HANYU_SPOUSEBOOK_LASTUSEDAY) then 
        flag[5] = 1
    	end
    	
    	return flag
    	            
	end
	
	if nType == 2 then
		  
		  local flag={[1]=0,[2]=0,[3]=0,[4]=0,[5]=0,[6]=0,[7]=0}
    	local today = GetDayTime()
    	--���˿����
    	if today == GetMissionData(sceneId, selfId, MD_XINGYUN_TIME_INFO) then 
        flag[1] = 1
    	end
    	
      --���    	
    	if today == GetMissionData(sceneId, selfId, MD_LAST_QIJU_DAY) then 
    		flag[2] = 1
    	end
    	
      --ʦ��20��
      local iDayCount=GetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT)
      local iTime = mod(iDayCount,100000)
      local iDayTime = floor(iTime/100)	--��һ�η��������ʱ��(����)
      local iDayHuan = floor(iDayCount/100000) --��������ɵ��������
      local CurTime = GetHourTime()		--��ǰʱ��
	    local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)

      if iDayTime == CurDaytime and 20 <= iDayHuan then 
    		flag[3] = 1
    	end
    	
      --�ƾٴ��50��
      if 1 == GetMissionData(sceneId, selfId, MD_EXAM_FEE_FLAG) then
      	local StartTime = GetMissionData(sceneId,selfId,MD_EXAM_STARTTIME) --�ƾ�ʱ��
      	local CurrentTime = LuaFnGetCurrentTime()                          --��ǰʱ��
        local ntime = CurrentTime - StartTime
        local CurTime = GetHourTime()								--��ǰʱ��
	      local CurQuarterTime = mod( CurTime, 100 )	--��ǰʱ��(��)
        --�ж��Ƿ��ǵ���Ŀƾ�
        if CurQuarterTime >= 70 and  ntime <= 23400 then
      		local times = GetMissionData(sceneId,selfId,MD_EXAM_SEQUENCE)
					local Question_Sequence_Before = floor(times/100)
					local Question_Sequence = mod(Question_Sequence_Before,10)
					local Examinator_Sequence = floor(Question_Sequence_Before/10) 
					
					if 5 <= Examinator_Sequence then
    		     flag[4] = 1
    		  end
    		 end
    	 end
    	
      --����
      if today == GetMissionData(sceneId, selfId, MD_HANYUBED_USEBOOK_LASTDAY) or today == GetMissionData(sceneId, selfId, MD_TW_HANYU_SPOUSEBOOK_LASTUSEDAY) then 
    		flag[5] = 1
    	end
    	
    	--�μ�����������һ����������ϵ�У�5��
	    local DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION3_TIMES )
	    local CurDate = mod( DayTimes, 100000 )
	    local takenTimes = floor( DayTimes/100000 )
	    if today == CurDate and takenTimes >= 5 then
		    flag[6] = 1
	    end
	     
	    --����������ʯ(δ����)
	    if LuaFnGetAvailableItemCount(sceneId,selfId,x889054_g_PiaoMiaoFengItemId) >= 1 then
	    	flag[7] = 1
    	end
    	
    	return flag           
  end
end
--**********************************
--��Ŀ��Ϣ��ʾ
--**********************************
function x889054_ShowTip( sceneId, selfId, tip )
	BeginEvent( sceneId )
      AddText( sceneId, tip )
  EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )		
end
