					
--��������
--����֪ͨ
--MisDescBegin
--�ű���
x250551_g_ScriptId = 250551

--�����
x250551_g_MissionId = 721

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x250551_g_Name	="������"

--������� 
x250551_g_MissionKind = 11

--����ȼ�
x250551_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x250551_g_IfMissionElite = 0

--������Ҫ�õ�����Ʒ
--g_DemandItem={{id=30701021,num=1}}


--������
x250551_g_MissionName="�ӿ���"
x250551_g_MissionInfo="���Ҹ���%s%s[%d,%d]����ϴ���Ҫ��ʼ�ˡ�"
x250551_g_MissionTarget="%f"
x250551_g_ContinueInfo="�ɵò���"		--δ��������npc�Ի�
x250551_g_MissionComplete="��֪���ˣ����Ǹ���Ľ���"

--���������ַ�����ʽ��������
x250551_g_FormatList = {
								"�ҵ�%n",
								}
								
--��ʽ�ַ����ж�Ӧ��g_StringList���ַ���������, ��ʾ��4��ʼ,�����λ��SetMissionByIndexEx(...)�Ķ��ٶ���
x250551_g_StrForePart=4

--MisDescEnd

x250551_g_fasongtongzhiNpcIndex = 5

--**********************************
--������ں���
--**********************************
function x250551_OnDefaultEvent( sceneId, selfId, targetId )
  --��������ɹ��������
  if( IsHaveMission(sceneId,selfId,x250551_g_MissionId) > 0)  then
  	if GetName(sceneId, targetId) == x250551_g_Name then
  		local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
  		local npcId = GetMissionParam(sceneId, selfId, misIndex, x250551_g_StrForePart+1)
  		local _, npcName, npcScene, x, z = GetNpcInfoByNpcId(sceneId,npcId)
  		local strText = format("�ҵĿ����ӵ���ô��%s%s����(%d��%d)������Ե��Alt+Q�鿴����Ŀ�ꡣ", npcScene, npcName, x, z)
			BeginEvent(sceneId)
				AddText(sceneId, strText)
			EndEvent()
			DispatchEventList(sceneId, selfId, -1)
  	else
	  	if x250551_CheckSubmit( sceneId, selfId ) > 0 then
		 		BeginEvent(sceneId)
					AddText(sceneId,x250551_g_MissionName)
					local BonusMoney = 500	--90 + (GetLevel(sceneId, selfId) - 10) * 5
					local BonusExp = 200
					AddText(sceneId, "������" .. tostring(BonusExp) .. "�㾭���" .. "#{_MONEY" .. tostring(BonusMoney) .. "}�����ȥ���������壬�����յ�����лл�㡣")
					SetMissionCacheData(sceneId, selfId, 0, BonusMoney)
					SetMissionCacheData(sceneId, selfId, 1, BonusExp)
				EndEvent( )
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x250551_g_ScriptId, x250551_g_MissionId,x250551_g_ScriptId)
			end	
		end
		--DispatchMissionDemandInfo(sceneId,selfId,targetId,x250551_g_ScriptId,x250551_g_MissionId,bDone,x250551_g_ScriptId)
    --���������������
  elseif x250551_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x250551_g_Name then
			--///////////////////////////////////////////////////
			--local playerLevel = GetLevel(sceneId, selfId)
			--if playerLevel >= 21 then
			--	BeginEvent(sceneId)
			--		AddText(sceneId, "��ĵȼ��Ѿ�����20���ˣ�ȥ��һЩ����ǰ;������ɡ�")
			--	EndEvent( )
			--	DispatchEventList(sceneId, selfId, -1)
			--	return 
			--end
			--///////////////////////////////////////////////////
			--begin modified by zhangguoxin 090207
			local iDayCount = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
			--local iTime = mod(iDayCount,100000)
			local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
			local iDayTime = floor(iTime/100)					--��һ�η��������ʱ��(����)
			local iQuarterTime = mod(iTime,100)				--��һ�η��������ʱ��(һ����)
			--local iDayHuan = floor(iDayCount/100000) 	--��������ɵ��������
			local iDayHuan = iDayCount 	--��������ɵ��������
			--print("iDayHuan ... is ... " .. iDayHuan)
			
			--local CurTime = GetHourTime()							--��ǰʱ��
			local CurTime = GetQuarterTime()							--��ǰʱ��
			local CurDaytime = floor(CurTime/100)			--��ǰʱ��(��)
			local CurQuarterTime = mod(CurTime,100) 	--��ǰʱ��(һ����)
			--end modified by zhangguoxin 090207
			
			if iDayTime ~= CurDaytime  then
				iDayHuan = 0
				CurQuarterTime = 99
			end

			if iDayHuan >= 10 then
				BeginEvent(sceneId)
					AddText(sceneId, "�������Ѿ���������10�ο����������������ɣ����ۻ��ˡ�")
				EndEvent( )
				DispatchEventList(sceneId, selfId, -1)
				return
				
			end

			if iDayTime == CurDaytime then
				if CurQuarterTime == iQuarterTime then
					BeginEvent(sceneId)
						AddText(sceneId, x250551_g_MissionName)
						AddText(sceneId, "  �����������������15�������㲻�ܽ����µ�����!")
					EndEvent( )
					DispatchEventList(sceneId, selfId, -1)
					return
				end
			end
			--/////////////////////////////////////////////////// end
			
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				--������������б�
				local bAdd = AddMission( sceneId,selfId, x250551_g_MissionId, x250551_g_ScriptId, 0, 0, 0 )
				if bAdd < 1 then
					return
				end	
				--Ѱ��, ��������������Ŀ��NPC���¼�Flag
				SetMissionEvent(sceneId, selfId, x250551_g_MissionId, 4)
				
				local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(x250551_g_fasongtongzhiNpcIndex)
				print(nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ)
				--print(nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc)
				Msg2Player(  sceneId, selfId,"#Y���������ӿ���", MSG2PLAYER_PARA )
				CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

				--�õ�������20�������е����к�
				local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
				
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --���������Ƿ���ɣ�δ��ɣ�
				
				SetMissionByIndex(sceneId, selfId, misIndex, x250551_g_StrForePart, 0)
				SetMissionByIndex(sceneId, selfId, misIndex, x250551_g_StrForePart+1, nNpcId)
				--////////////////////////////////////////////////////////////
				AddText(sceneId,x250551_g_MissionName)
				local str = format("���Ҹ���%s%s[%d,%d]����ϴ���Ҫ��ʼ�ˡ�", strNpcScene, strNpcName, nPosX, nPosZ)
				AddText(sceneId, str)
				AddText(sceneId,"#{M_MUBIAO}")
				local strMissionTarget = format("�ҵ�%s%s[%d,%d]", strNpcScene, strNpcName, nPosX, nPosZ)
				AddText(sceneId, strMissionTarget)
				
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
  end
  
end

--**********************************
--�о��¼�
--**********************************
function x250551_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x250551_g_MissionId) > 0 then
    	AddNumText(sceneId,x250551_g_ScriptId,x250551_g_MissionName,3,-1);
	  --���������������
    elseif x250551_CheckAccept(sceneId,selfId) > 0 then
			if GetName(sceneId,targetId) == x250551_g_Name then
				AddNumText(sceneId,x250551_g_ScriptId,x250551_g_MissionName,4,-1);
			end
    end
end

--**********************************
--����������
--**********************************
function x250551_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--����
--**********************************
function x250551_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x250551_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
	local npcId = GetMissionParam(sceneId, selfId, misIndex, x250551_g_StrForePart+1)
	local  _, strNpcName, strNpcScene, x, z, desc, scene = GetNpcInfoByNpcId(sceneId,npcId)
	
  DelMission( sceneId, selfId, x250551_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, scene, strNpcName, x250551_g_MissionId)
	
	-- �����ﻹ��Ҫ������������ͷ���ʱ���ǲ��ǹ�ȥһ���ˣ������ȥ�ˣ����ȸ���
	--begin modified by zhangguoxin 090207
	local iDayCount=GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
	local iDayTime = floor(iTime/100)		--��һ�η��������ʱ��(����)
	local iQuarterTime = mod(iTime,100)	--��һ�η��������ʱ��(��)
	--local iDayHuan = floor(iDayCount/100000) --��������ɵ��������
	local iDayHuan = iDayCount --��������ɵ��������

	--local CurTime = GetHourTime()		--��ǰʱ��
	local CurTime = GetQuarterTime()		--��ǰʱ��
	local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
	
	if CurDaytime~=iDayTime then 	--�ϴ����������ͬһ����
		iDayHuan = 0
	end
	
	--iDayCount = iDayHuan*100000 + CurTime 

	--����ѭ�������ʱ��
	--SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT,iDayCount)
	SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT,iDayHuan)
	SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME,CurTime)
	--end modified by zhangguoxin 090207
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x250551_CheckSubmit( sceneId, selfId )
	if IsHaveMission(sceneId,selfId,x250551_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 1 then
			return 1
		end
	else
		return 0	
	end
end

--**********************************
--�ύ
--**********************************
function x250551_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	if x250551_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--begin modified by zhangguoxin 090207
		local iDayCount=GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
		--local iTime = mod(iDayCount,100000)
		local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
		local iDayTime = floor(iTime/100)		--��һ�η��������ʱ��(����)
		local iQuarterTime = mod(iTime,100)	--��һ�η��������ʱ��(��)
		--local iDayHuan = floor(iDayCount/100000)	--��������ɵ��������
		local iDayHuan = iDayCount 									--��������ɵ��������
	
		--local CurTime = GetHourTime()		--��ǰʱ��
		local CurTime = GetQuarterTime()		--��ǰʱ��
		local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
		local CurQuarterTime = mod(CurTime,100)	--��ǰʱ��(��)
		
		if CurDaytime==iDayTime then 	--�ϴ����������ͬһ����
			iDayHuan = iDayHuan+1
		else							--�ϴ����������ͬһ�죬����
			iDayTime = CurDaytime
			iDayHuan = 1
		end
		
		-- ֻҪ��ҽ������񣬾��÷��������������Ч
		iQuarterTime = 99
		
		--iDayCount = iDayHuan*100000+iDayTime*100+iQuarterTime 
		iDayCount = iDayHuan;
		local newTime = CurDaytime * 100 + iQuarterTime;
		--����ѭ�������DAYCOUNT
		SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT,iDayCount)
		SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME,newTime)
		--end modified by zhangguoxin 090207
		
		local BonusMoney = GetMissionCacheData(sceneId, selfId, 0)
		local BonusExp = GetMissionCacheData(sceneId, selfId, 1)
		AddMoney(sceneId,selfId,BonusMoney )
		AddExp(sceneId,selfId,BonusExp )
		
		----------------------------------------changed by xindefeng-------------------------------------------------
		--AddMoney()&AddExp()�������ϵͳƵ����ʾ,���Խ�����������ʾע�͵�
		----Msg2Player(  sceneId, selfId, "������" .. tostring(BonusExp) .. "�㾭��", MSG2PLAYER_PARA )
		----Msg2Player(  sceneId, selfId, "������#{_MONEY" .. tostring(BonusMoney) .. "}", MSG2PLAYER_PARA )
		----------------------------------------changed by xindefeng-------------------------------------------------
		
		DelMission( sceneId,selfId, x250551_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y��������ӿ���",MSG2PLAYER_PARA )
		-- ��ÿ����ɵ�10�κ͵�20�ε�ʱ���������������
		if iDayHuan == 5 or iDayHuan == 10   then
			LuaFnSendGuajiQuestion(sceneId,selfId)
		end
	end
end

function x250551_OnLockedTarget(sceneId, selfId, objId )
	-- �ж��ǲ���������Npc
	if IsHaveMission(sceneId, selfId, x250551_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)		--�õ�������20�������е����к�
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		
		local nNpcId = GetMissionParam(sceneId, selfId, misIndex, x250551_g_StrForePart+1)
		local _, strNpcName, strNpcScene, PosX, PosZ, desc = GetNpcInfoByNpcId(sceneId,nNpcId)
			 
		if GetName(sceneId, objId) == strNpcName then
			TAddNumText(sceneId, x250551_g_ScriptId,x250551_g_MissionName,4,-1,x250551_g_ScriptId);
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
		end	
	end 
	
	return 0;

end
	
											
