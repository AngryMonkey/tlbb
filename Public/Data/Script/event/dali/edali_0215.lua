--����������

--************************************************************************
--MisDescBegin

--�ű���
x210215_g_ScriptId = 210215

--��һ�������ID
x210215_g_MissionIdPre = 454

--�����
x210215_g_MissionId = 455

--����Ŀ��npc
x210215_g_Name	="��ƮƮ"

--�������
x210215_g_MissionKind = 13

--����ȼ�
x210215_g_MissionLevel = 5

--�Ƿ��Ǿ�Ӣ����
x210215_g_IfMissionElite = 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******

--**********************************�����Ƕ�̬****************************

--�����ı�����
x210215_g_MissionName="����������"
x210215_g_MissionInfo="#{event_dali_0021}"  --��������
x210215_g_MissionTarget="#{event_dali_0022}"		--����Ŀ��
x210215_g_ContinueInfo="  С��������2������"		--δ��������npc�Ի�
x210215_g_MissionComplete="#{event_dali_0023}"					--�������npc˵���Ļ�
x210215_g_SignPost = {x = 263, z = 129, tip = "��ƮƮ"}

--������
x210215_g_MoneyBonus=20

--MisDescEnd
--************************************************************************

--��ɫMission����˵��
--0�ţ�δ��
--1�ţ�δ��
--2�ţ�δ��
--3�ţ�δ��
--4�ţ�δ��
--5�ţ�δ��
--6�ţ�δ��
--7�ţ�δ��
x210215_g_PetNeedLevel=2	--��Ҫ�����������ĵȼ�
x210215_g_PetDataID=559	--�������޵ı��

--**********************************
--������ں���
--**********************************
function x210215_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	if IsHaveMission(sceneId,selfId,x210215_g_MissionId) > 0 then --����ѽӴ�����
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210215_g_MissionName)
			AddText(sceneId,x210215_g_ContinueInfo)
			AddMoneyBonus( sceneId, x210215_g_MoneyBonus )
		EndEvent( )
		bDone = x210215_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210215_g_ScriptId,x210215_g_MissionId,bDone)
	elseif x210215_CheckAccept(sceneId,selfId) > 0 then --���������������
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210215_g_MissionName)
			AddText(sceneId,x210215_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210215_g_MissionTarget)
			AddMoneyBonus( sceneId, x210215_g_MoneyBonus )
			EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210215_g_ScriptId,x210215_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210215_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210215_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210215_g_MissionId) > 0 then
		return
	end
    if IsHaveMission(sceneId,selfId,x210215_g_MissionId) > 0 then
			AddNumText(sceneId,x210215_g_ScriptId,x210215_g_MissionName,2,-1);
		--���������������
	elseif x210215_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x210215_g_ScriptId,x210215_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x210215_CheckAccept( sceneId, selfId )

	if IsMissionHaveDone(sceneId,selfId,x210215_g_MissionId) > 0 then
		return 0
	end
	--��������
	if GetLevel( sceneId, selfId ) >= x210215_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210215_OnAccept( sceneId, selfId )

	if x210215_CheckAccept(sceneId, selfId) ~= 1 then
		return
	end
	
	local ret, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, x210215_g_PetDataID, -1, 0) --���������һֻ����
	if ret==1 then
		--������������б�
		AddMission( sceneId,selfId, x210215_g_MissionId, x210215_g_ScriptId, 0, 0, 0 )	--�������
		BeginEvent(sceneId)
			strText = "��õ���һ������!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y������������������",MSG2PLAYER_PARA )
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210215_g_SignPost.x, x210215_g_SignPost.z, x210215_g_SignPost.tip )
	end
end

--**********************************
--����
--**********************************
function x210215_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210215_g_MissionId )
    --ɾ����������
	petcount = LuaFnGetPetCount(sceneId, selfId) --ȡ����������
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --ȡ�����ޱ��
		if petdataid==x210215_g_PetDataID then
			local ret0 = LuaFnDeletePet(sceneId, selfId, i)
		end
   end
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210215_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210215_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210215_g_MissionName)
		AddText(sceneId,x210215_g_MissionComplete)
		AddMoneyBonus( sceneId, x210215_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210215_g_ScriptId,x210215_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210215_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210215_g_MissionId )

	-- ������ǲ�����һ���ȼ�Ϊ2���ĳ���о�OK
	local nPetCount = LuaFnGetPetCount(sceneId, selfId)
	
	for i=0, nPetCount-1  do
		local nPetId = LuaFnGetPet_DataID(sceneId, selfId, i)
		local nPetLevel = LuaFnGetPet_Level(sceneId, selfId, i)
		
		if nPetId==559 and nPetLevel>=2  then
			return 1
		end
	end

	return 0
end

--**********************************
--�ύ
--**********************************
function x210215_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	--�������ǲ��������
	if x210215_CheckSubmit( sceneId, selfId ) ~= 1   then
		return
	end

	AddMoney(sceneId,selfId,x210215_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId,810)
	local ret0 = DelMission( sceneId, selfId, x210215_g_MissionId ) --ɾ������
	if ret0>0  then
		MissionCom( sceneId,selfId, x210215_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y�����������������",MSG2PLAYER_PARA )
		CallScriptFunction( 210216, "OnDefaultEvent",sceneId, selfId, targetId)
	end

	BeginEvent(sceneId)
		strText = "�������"
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--ɱ����������
--**********************************
function x210215_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--���������¼�
--**********************************
function x210215_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210215_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����ύ����Ʒ������
--**********************************
function x210215_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	
end

