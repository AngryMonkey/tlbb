--��֮��--��һ����ͷ�͸�С��ؤ
--������
--MisDescBegin
--�ű���
x210226_g_ScriptId = 210226

--�����
x210226_g_MissionId = 706

--��һ�������ID
x210226_g_MissionIdPre = 705

--Ŀ��NPC
x210226_g_Name	="������"

--�������
x210226_g_MissionKind = 13

--����ȼ�
x210226_g_MissionLevel = 8

--�Ƿ��Ǿ�Ӣ����
x210226_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210226_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--�����ı�����
x210226_g_MissionName="����ͷ"
x210226_g_MissionInfo="  [ԭ������Ϊ���Ǹ�ʾ���ġ��Ҳ�����ϻ����Ǳ��и�#RС��ؤ#W��Ҫ�����ˣ���ȥ�Ҹ�#Y��ͷ#W�͸�����]"
x210226_g_MissionTarget="#{event_dali_0037}"
x210226_g_ContinueInfo="  [���Ѿ���#Y��ͷ#W�͵�#RС��ؤ#W��������]"
x210226_g_MissionComplete="  [�ţ���������������˻��Ǹ�����֮�ġ�]"
x210226_g_SignPost = {x = 199, z = 256, tip = "С��ؤ"}
x210226_g_Custom	= { {id="��С��ؤ����ͷ��",num=1} }
--������
x210226_g_MoneyBonus=100
--g_ItemBonus={{id=40002108,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210226_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210226_g_MissionId) > 0 then
	--	return
	--end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210226_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210226_g_MissionName)
			AddText(sceneId,x210226_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210226_g_MoneyBonus )
		EndEvent()
		bDone = x210226_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210226_g_ScriptId,x210226_g_MissionId,bDone)		
    --���������������
    elseif x210226_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210226_g_MissionName)
			AddText(sceneId,x210226_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210226_g_MissionTarget)
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210226_g_MoneyBonus )
			EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210226_g_ScriptId,x210226_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x210226_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210226_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210226_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x210226_g_MissionId) > 0 then
		AddNumText(sceneId,x210226_g_ScriptId,x210226_g_MissionName,2,-1);
		--���������������
	elseif x210226_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210226_g_ScriptId,x210226_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x210226_CheckAccept( sceneId, selfId )
	--��Ҫ8�����ܽ�
	if GetLevel( sceneId, selfId ) >= 8 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210226_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210226_g_MissionId, x210226_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x210226_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y������������ͷ",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210226_g_SignPost.x, x210226_g_SignPost.z, x210226_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210226_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210226_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210226_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210226_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210226_g_MissionName)
		AddText(sceneId,x210226_g_MissionComplete)
		AddMoneyBonus( sceneId, x210226_g_MoneyBonus )
		--for i, item in g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
		--for i, item in g_RadioItemBonus do
		--	AddRadioItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210226_g_ScriptId,x210226_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210226_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210226_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210226_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x210226_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210226_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	--BeginAddItem(sceneId)
		--	for i, item in g_ItemBonus do
		--		AddItem( sceneId,item.id, item.num )
		--	end
		--ret = EndAddItem(sceneId,selfId)
		--���������
		--if ret > 0 then
		--else
		--������û�мӳɹ�
		--	BeginEvent(sceneId)
		--		strText = "��������,�޷��������"
		--		AddText(sceneId,strText);
		--	EndEvent(sceneId)
		--	DispatchMissionTips(sceneId,selfId)
		--end
		AddMoney(sceneId,selfId,x210226_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 400)
		--�۳�������Ʒ
		--for i, item in g_DemandItem do
		--	DelItem( sceneId, selfId, item.id, item.num )
		--end
		ret = DelMission( sceneId, selfId, x210226_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x210226_g_MissionId )
			--AddItemListToHuman(sceneId,selfId)
			Msg2Player(  sceneId, selfId,"#Y�����������ͷ",MSG2PLAYER_PARA )
			CallScriptFunction( 210227, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210226_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210226_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210226_OnItemChanged( sceneId, selfId, itemdataId )
end
