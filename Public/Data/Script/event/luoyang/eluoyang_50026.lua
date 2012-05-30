--׽��������
--׽����
--MisDescBegin
--�ű���
x250026_g_ScriptId = 250026

--�����
x250026_g_MissionId = 720

--����Ŀ��npc
x250026_g_Name	="�ƺ���"

--�������
x250026_g_MissionKind = 11

--����ȼ�
x250026_g_MissionLevel = 75

--�Ƿ��Ǿ�Ӣ����
x250026_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x250026_g_IsMissionOkFail = 0		--�����ĵ�0λ

x250026_g_PetDataID=3250	--�������޵ı��
--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x250026_g_MissionName="��׽����"
x250026_g_MissionInfo="�Ҽ�С����Ҫһֻ��ȸ��"  --��������
x250026_g_MissionTarget="���ƺ����ҵ�һֻ��ȸ��"		--����Ŀ��
x250026_g_ContinueInfo="��׽����ȸ����"		--δ��������npc�Ի�
x250026_g_MissionComplete="�ɵĲ���"					--�������npc˵���Ļ�

--������
x250026_g_MoneyBonus = 2790

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x250026_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x250026_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x250026_g_MissionName)
			AddText(sceneId,x250026_g_ContinueInfo)
		EndEvent( )
		bDone = x250026_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x250026_g_ScriptId,x250026_g_MissionId,bDone)
	--���������������
	elseif x250026_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x250026_g_MissionName)
			AddText(sceneId,x250026_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x250026_g_MissionTarget)
			--AddMoneyBonus( sceneId, x250026_g_MoneyBonus )
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x250026_g_ScriptId,x250026_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x250026_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x250026_g_MissionId) > 0 then
		AddNumText(sceneId,x250026_g_ScriptId,x250026_g_MissionName,3,-1);
    --���������������
    elseif x250026_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x250026_g_ScriptId,x250026_g_MissionName,4,-1);
    end
end

--**********************************
--����������
--**********************************
function x250026_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����Ƿ����������15���ӣ����δ�������򲻿��Խ�������ԭ����Ϊ�˷�ֹ�������ˢ������ˢ���Լ���ץ�����ޡ�
--**********************************
function x250026_GetTimePass( sceneId, selfId )        --create by Steven.Han
   
  --���׽�����������ʱ���Ƿ񳬹�15���ӣ��������������1�����򣬷���0

  local iDayCount=GetMissionData( sceneId, selfId, MD_CAPTUREPETABANDON_TIME )
  
  if( 0 == iDayCount ) then
      return 1                   --�����0����ʾ��δ�������������ǿ��Խ��ܵġ�
  end
  
  local CurTime = GetHourTime()		--��ǰʱ��
	local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
	local CurQuarterTime = mod(CurTime,100)	--��ǰʱ��(��)

	local OldDaytime = floor(iDayCount/100)	--�ϴη�����ʱ��(��)
	local OldQuarterTime = mod(iDayCount,100)	--�ϴη�����ʱ��(��)  	
  
  if( CurDaytime > OldDaytime ) then
      return 1               --����Ѿ�����һ���ˣ�����Ϊ������15���ӡ�
  end
  
  if( OldQuarterTime == CurQuarterTime ) then
      return 0
  end	
	
	return 1

end

--**********************************
--����
--**********************************
function x250026_OnAccept( sceneId, selfId )

  if( 0 == x250026_GetTimePass( sceneId, selfId ) ) then      
      --Msg2Player(  sceneId, selfId,"#Y�������������15���ӣ��޷��ٴν���",MSG2PLAYER_PARA )	--���촰����ʾ
      
		  BeginEvent(sceneId)
			  strText = format("�������������15���ӣ��޷��ٴν���")
			  AddText(sceneId,strText)
 		  EndEvent(sceneId)

 		  DispatchMissionTips(sceneId,selfId)
 		      
      return
  end	
  
	--������������б�
	AddMission( sceneId,selfId, x250026_g_MissionId, x250026_g_ScriptId,0,0,0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x250026_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x250026_g_ScriptId)						--�������кŰ���������ĵ�1λ��Ϊ����ű���
	--���������ϵĵ����Ƿ��Ѿ������������������Ѿ����㣬����������ı�����Ϊ1
	if x250026_CheckSubmit( sceneId, selfId ) then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
	end
	--��ʾ���ݸ�������Ѿ�����������
--	BeginEvent(sceneId)
--		AddText(sceneId,x250026_g_MissionInfo)
--	EndEvent(sceneId)
--	DispatchEventList(sceneId,selfId,targetId)	--�Ի�����ʾMissionInfo
	Msg2Player(  sceneId, selfId,"#Y�������񣺲�׽����",MSG2PLAYER_PARA )	--���촰����ʾ
end

--**********************************
--����
--**********************************
function x250026_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x250026_g_MissionId )
    
    local CurTime = GetHourTime()		--��ǰʱ��	
	  SetMissionData(sceneId,selfId,MD_CAPTUREPETABANDON_TIME,CurTime )     --�ѵ�ǰʱ������Ϊ����ʱ��  Steven.Han
    --Msg2Player(  sceneId, selfId,"#Y������˲�׽��������15����֮���㽫�޷��ٴν��ܴ�����",MSG2PLAYER_PARA )	--���촰����ʾ
    
end

--**********************************
--����
--**********************************
function x250026_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x250026_g_MissionName)
    AddText(sceneId,x250026_g_MissionComplete)
    --AddMoneyBonus( sceneId, x250026_g_MoneyBonus )
    --for i, item in g_ItemBonus do
	--	AddItemBonus( sceneId, item.id, item.num )
	--end
    --for i, item in g_RadioItemBonus do
	--	AddRadioItemBonus( sceneId, item.id, item.num )
	--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x250026_g_ScriptId,x250026_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x250026_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x250026_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	--�õ�Я����������
	PetNum = LuaFnGetPetCount(sceneId,selfId)
	if PetNum ~= 0 then
		for i = 1,PetNum,1 do
			PetIndex = i - 1		--����index��0��ʼ
			if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == x250026_g_PetDataID then
				return 2
			end
		end
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x250026_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x250026_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x250026_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x250026_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����ύ����Ʒ������
--**********************************
function x250026_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	if indexpet == 255 then --����ֵ����255��ʾ�գ�û�ύ����
		BeginEvent(sceneId)
			strText = "��������϶���������!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		--�õ����봰���е����ޱ��
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, indexpet )
		if petdataid == x250026_g_PetDataID then
			--������Ǯ����ʾ
			
				BeginEvent(sceneId)
					AddText(sceneId,"��ϲ����������񣬽�����#{_MONEY"..x250026_g_MoneyBonus.."}")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,npcid)
			ret0 = DelMission( sceneId, selfId, x250026_g_MissionId ) --ɾ������
			ret1 = LuaFnDeletePet(sceneId, selfId, indexpet ) --ɾ������
			if ret0>0 and ret1>0 then
				Msg2Player(  sceneId, selfId,"������񣺲�׽����",MSG2PLAYER_PARA )
				AddMoney(sceneId, selfId, x250026_g_MoneyBonus )
			end
			
			BeginEvent(sceneId)
				strText = "�������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				strText = "������������!"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

