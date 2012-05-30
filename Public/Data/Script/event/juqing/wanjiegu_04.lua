-- �������񡪡���ٹ�  ���������ŵ�������
-- ʯ�ҵ�->������

--MisDescBegin
--�ű���
x200004_g_ScriptId = 200004

--�����
x200004_g_MissionId = 4

--ǰ������
x200004_g_PreMissionId = 3

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x200004_g_Name	="������"

--�������
x200004_g_MissionKind = 51

--����ȼ�
x200004_g_MissionLevel = 20

--�Ƿ��Ǿ�Ӣ����
x200004_g_IfMissionElite = 0

--��������NPC����
x200004_g_Position_X=62.9422
x200004_g_Position_Z=35.9417
x200004_g_SceneID=2
x200004_g_AccomplishNPC_Name="������"

--������
x200004_g_MissionName="�����ӯ"
x200004_g_MissionInfo="#{Mis_juqing_0004}"
x200004_g_MissionTarget="#{Mis_juqing_Tar_0004}"
x200004_g_MissionComplete="  �⣬�⣬�����ϰ��������֪ͨ���֡�"

x200004_g_MoneyBonus=10
x200004_g_exp=6900

x200004_g_RadioItemBonus={{id=10414001 ,num=1},{id=10414002,num=1},{id=10414003,num=1},{id=10414004,num=1}}

x200004_g_Custom	= { {id="���ҵ�������",num=1} }

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x200004_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200004_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200004_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200004_g_Name then
			x200004_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x200004_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200004_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
			AddText(sceneId,x200004_g_MissionName)
			AddText(sceneId,x200004_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200004_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200004_g_MoneyBonus )
			for i, item in x200004_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200004_g_ScriptId,x200004_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200004_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200004_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200004_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200004_g_Name then
			AddNumText(sceneId, x200004_g_ScriptId,x200004_g_MissionName,2,-1);
		end
	--���������������
	elseif x200004_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200004_g_Name then
			AddNumText(sceneId,x200004_g_ScriptId,x200004_g_MissionName,1,-1);
		end
	end
end

--**********************************
--����������
--**********************************
function x200004_CheckAccept( sceneId, selfId )
	--��Ҫ3�����ܽ�
	if GetLevel( sceneId, selfId ) < 20 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200004_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--����
--**********************************
function x200004_OnAccept( sceneId, selfId, targetId )
	if x200004_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200004_g_MissionId, x200004_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y�������񣺶����ӯ",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200004_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--����
--**********************************
function x200004_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200004_g_MissionId )
--	--CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200004_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200004_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200004_g_MissionName)
		AddText(sceneId,x200004_g_MissionComplete)
		AddMoneyBonus( sceneId, x200004_g_MoneyBonus )
		for i, item in x200004_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200004_g_ScriptId,x200004_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200004_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200004_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200004_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200004_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
  	BeginAddItem(sceneId)
		for i, item in x200004_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret < 1 then
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		AddItemListToHuman(sceneId,selfId)

		--���������
		AddMoney(sceneId,selfId,x200004_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200004_g_exp)

		DelMission( sceneId,selfId,  x200004_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200004_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y������񣺶����ӯ",MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200002), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200004_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200004_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200004_OnItemChanged( sceneId, selfId, itemdataId )
end
