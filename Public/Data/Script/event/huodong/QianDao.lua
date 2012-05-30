--ǩ����������ǰ����
--xiehong

x889053_g_ScriptId	= 889053;

--�BUFFid
x889053_g_Buff_Id	= 20003

--��ʼ��������
--ע�⣺���Ҫ�¿����һ��Ҫ�Ŀ�ʼ���ڴ�����һ�εĽ������ڣ������¼��ҲμӼ�����MD��������
x889053_g_BeginTime	= 20090709
x889053_g_EndTime	= 20090816


--�ȼ�����
x889053_g_MinLevel	= 10

--���Ի�ý����Ĵ���
x889053_g_AwardInfo	= {

{Cycle = 7,	AwardItemId1 = 30008002, AwardCount1 = 1, NeedBagSpace1 = 1, AwardItemId2 = 10124141, AwardCount2 = 1, NeedBagSpace2 = 1}, 

{Cycle = 14, AwardItemId1 = 30008002, AwardCount1 = 1, NeedBagSpace1 = 1, AwardItemId2 = 50313004, AwardCount2 = 1, NeedBagSpace2 = 1},--������

{Cycle = 28, AwardItemId1 = 30008002, AwardCount1 = 1, NeedBagSpace1 = 1, AwardItemId2 = 30900045, AwardCount2 = 1, NeedBagSpace2 = 1},

{Cycle = 35, AwardItemId1 = 30008002, AwardCount1 = 1, NeedBagSpace1 = 1, AwardItemId2 = 50313004, AwardCount2 = 2, NeedBagSpace2 = 2},--������
							
  }


--**********************************
--�о��¼�
--**********************************
function x889053_OnEnumerate( sceneId, selfId, targetId )

	if x889053_IsInActTime() > 0 then
		AddNumText( sceneId, x889053_g_ScriptId, "#{TLXQC_090306_2}", 6, 1 );
	end
	
end

--**********************************
--������ں���
--**********************************
function x889053_OnDefaultEvent( sceneId, selfId, targetId )	--���������ǰ��

	local opt = GetNumText();
	if opt == 1 then
		
		BeginEvent(sceneId)
			local playerName = GetName( sceneId,selfId )
			local msg = format( "    #{_INFOUSR%s}#{TLXQC_090306_3}", playerName )
			
			local insertMsg = x889053_InsertMsg( sceneId, selfId, 1 )

			AddText( sceneId, msg.."#r #r    "..insertMsg );							--�Ի�
			
			AddNumText( sceneId, x889053_g_ScriptId, "#{TLXQC_090306_4}", 6, 11 );		--��ť����Ҫ�μӡ�������ǰ�塷
			AddNumText( sceneId, x889053_g_ScriptId, "#{TLXQC_090306_5}", 6, 12 );		--��ť����ѯ�μӴ���
			AddNumText( sceneId, x889053_g_ScriptId, "#{TLXQC_090306_6}", 6, 13 );		--��ť��������ǰ��˵��
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif opt == 11 then																--�����ť����Ҫ�μӡ�������ǰ�塷
		
		if x889053_CheckCanJoinAndNotice( sceneId, selfId, targetId ) == 1 then
			x889053_Join( sceneId, selfId, targetId )
		end
		
	elseif opt == 12 then																--�����ť����ѯ�μӴ���
			
		insertMsg = x889053_InsertMsg( sceneId, selfId, 1 )
		
		BeginEvent(sceneId)
			AddText( sceneId, "    "..insertMsg );
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif opt == 13 then																--�����ť��������ǰ��˵��
		
		BeginEvent(sceneId)
			AddText( sceneId,  "    #{TLXQC_090306_7}");
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
		
	end
end


--���ɲ���Ի�
function x889053_InsertMsg( sceneId, selfId, query )
	
	local insertMsg = ""
	local joinCount = x889053_GetJoinCount( sceneId, selfId )
	if joinCount == 0 then
		insertMsg = "#{TLXQC_090306_8}"
	else
	
		local awardLeftCount = x889053_AwardLeftCount( sceneId, selfId, joinCount )
		
		if awardLeftCount == 1 then
			if query == 1 then 
				insertMsg = "#{TLXQC_090306_9}"..joinCount.."#{TLXQC_090306_10}"..awardLeftCount.."#{TLXQC_090306_11}"
			else
				insertMsg = "#{TLXQC_090306_9}"..joinCount.."#{TLXQC_090306_10}"..awardLeftCount.."#{TLXQC_090306_22}"
			end
		elseif awardLeftCount ~= 0 then
			if query == 1 then 
				insertMsg = "#{TLXQC_090306_9}"..joinCount.."#{TLXQC_090306_10}"..awardLeftCount.."#{TLXQC_090306_12}"
			else
				insertMsg = "#{TLXQC_090306_9}"..joinCount.."#{TLXQC_090306_10}"..awardLeftCount.."#{TLXQC_090306_22}"
			end
		elseif awardLeftCount == 0 then
			if query == 1 then
				insertMsg = "#{TLXQC_090306_9}"..joinCount.."#{TLXQC_090306_23}"
			else
				insertMsg = "#{TLXQC_090306_13}"
			end
		end
	end
	
	return insertMsg
	
end


--�Ƿ�ʱ��
function x889053_IsInActTime( )	

	local curDate = GetTime2Day( )
	
	--����ǻʱ���򷵻ؽ�������
	if curDate >= x889053_g_BeginTime and curDate <= x889053_g_EndTime then
		return curDate
	end
	
	--���򷵻�0
	return 0
	
end

--ȡ�õ�ǰ�μӻ����
function x889053_GetJoinCount( sceneId, selfId )
	
	local lastJoinDate = GetMissionData( sceneId, selfId, MD_TW_QIANDAO_LAST_JOIN_TIME )
	if lastJoinDate < x889053_g_BeginTime or lastJoinDate > x889053_g_EndTime then
		return 0
	end
	
	local joinCount = GetMissionData( sceneId, selfId, MD_TW_QIANDAO_JOIN_COUNT )
	
	return joinCount
	
end

--ȡ�û���Ҫ���ٴο����콱���������˾ͷ���0
function x889053_AwardLeftCount( sceneId, selfId, joinCount )
	
	local awardLeftCount = 0
	for i, awrad in x889053_g_AwardInfo do
		if awrad.Cycle > joinCount then
			awardLeftCount = awrad.Cycle - joinCount
			break
		end
	end
	
	return awardLeftCount
end

function x889053_CheckCanJoinAndNotice( sceneId, selfId, targetId )
	
	--�Ƿ��ڻʱ���ڣ�����Ӧ��ͨ����
	local curDate = x889053_IsInActTime( )
	if curDate == 0 then
		x889053_ReturnDlg( sceneId, selfId, targetId, "#{TLXQC_090306_25}" )
		return 0
	end
	
	--�жϵȼ�
	if GetLevel( sceneId, selfId ) < x889053_g_MinLevel then
		x889053_ReturnDlg( sceneId, selfId, targetId, "    #{TLXQC_090306_14}" )
		return 0
	end
	
	--�жϽ����Ƿ�μӹ�
	local lastJoinDate = GetMissionData( sceneId, selfId, MD_TW_QIANDAO_LAST_JOIN_TIME )
	if curDate <= lastJoinDate then
		x889053_ReturnDlg( sceneId, selfId, targetId, "    #{TLXQC_090306_15}" )
		return 0
	end
	
	--�ж�BUFF�Ƿ���
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x889053_g_Buff_Id ) == 1 then
		x889053_ReturnDlg( sceneId, selfId, targetId, "    #{TLXQC_090306_16}" )
		return 0
	end
	
	return 1
end

function x889053_Join( sceneId, selfId, targetId )
	
	local joinCount = x889053_GetJoinCount( sceneId, selfId )
	--joinCount = joinCount + 1
	
	local getAward = 0
	for i, awrad in x889053_g_AwardInfo do
		if awrad.Cycle == joinCount+1 then
			
			--�жϱ����Ƿ�
			local error = 0
			if awrad.Cycle == 7 or awrad.Cycle == 28 then
				if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awrad.NeedBagSpace1 + awrad.NeedBagSpace2 then
					x889053_Tips( sceneId, selfId, "#{TLXQC_090306_19}"..(awrad.NeedBagSpace1+awrad.NeedBagSpace2).. "#{TLXQC_090306_20}" )
					error = 1
				end
			end
			if awrad.Cycle == 14 or awrad.Cycle == 35 then
				if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awrad.NeedBagSpace1 then
					x889053_Tips( sceneId, selfId, "#{TLXQC_090306_19}"..awrad.NeedBagSpace1.. "#{TLXQC_090306_20}" )
					error = 1
				end
				if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awrad.NeedBagSpace2 then
					x889053_Tips( sceneId, selfId, "#{TLXQC_090703_1}"..awrad.NeedBagSpace2.. "#{TLXQC_090306_20}" )
					error = 1
				end
			end
			if error == 1 then
				--�������ո���ʱ��ֻ������Ŀ��ʾ��������npc�Ի���ֱ�ӹرնԻ���
				x889053_CloseDlg( sceneId, selfId, targetId )
				return
			end
			
			--����
			local bIsSuccess = 1
	
			for i = 1, awrad.AwardCount1 do
				local ret1 = TryRecieveItem( sceneId, selfId, awrad.AwardItemId1, QUALITY_CREATE_DEFAULT)
				if ret1 == -1 then
					bIsSuccess = 0
				else
					LuaFnItemBind(sceneId, selfId,ret1)
				end
			end
			for j = 1, awrad.AwardCount2 do
				local ret2= TryRecieveItem( sceneId, selfId, awrad.AwardItemId2, QUALITY_CREATE_DEFAULT)
				if ret2 == -1 then
					bIsSuccess = 0
				else
					LuaFnItemBind(sceneId, selfId,ret2)
				end
			end
			
			if bIsSuccess == 1 then 
				--ͳ����ȡ����
				AuditQianDao( sceneId, selfId, 1, awrad.AwardCount1 )
				AuditQianDao( sceneId, selfId, 1, awrad.AwardCount2 )
				x889053_Tips( sceneId, selfId, "#{TLXQC_090306_17}"..awrad.AwardCount1.."#{TLXQC_090306_24}#{_ITEM"..awrad.AwardItemId1.."}#{TLXQC_090306_18}" )
				x889053_Tips( sceneId, selfId, "#{TLXQC_090306_17}"..awrad.AwardCount2.."#{TLXQC_090306_24}#{_ITEM"..awrad.AwardItemId2.."}#{TLXQC_090306_18}" )
				--��ȡ������رնԻ���
				x889053_CloseDlg( sceneId, selfId, targetId )
				getAward = 1
			end
			break
		end
	end
	joinCount = joinCount + 1
	--��BUFF
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x889053_g_Buff_Id, 0 )
	
	local curDate = GetTime2Day( )
	SetMissionData( sceneId, selfId, MD_TW_QIANDAO_LAST_JOIN_TIME, curDate )
	SetMissionData( sceneId, selfId, MD_TW_QIANDAO_JOIN_COUNT, joinCount )
	
	--ͳ�Ʋμӻ
	AuditQianDao( sceneId, selfId, 0, 0 )
	
	--���������ȡ�����Ĵ�������NPC��������ʣ���ٴο�����
	if getAward ~= 1 then
		local msg = x889053_InsertMsg( sceneId, selfId, 0 )
		x889053_ReturnDlg( sceneId, selfId, targetId, "    "..msg )
	end
end

--**********************************
--���ضԻ�
--**********************************
function x889053_ReturnDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ReturnTips
--**********************************
function x889053_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--�رնԻ���
--**********************************
function x889053_CloseDlg(sceneId, selfId, targetId)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )	
end

--**********************************
--����
--**********************************
function x889053_OnAccept( sceneId, selfId )


end

--**********************************
--����
--**********************************
function x889053_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x889053_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x889053_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x889053_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x889053_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x889053_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x889053_OnItemChanged( sceneId, selfId, itemdataId )
end

