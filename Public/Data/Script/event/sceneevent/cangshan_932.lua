--��ɽ ��Ѩ��Ӫ ̽��������
--212121


--MisDescBegin
--�ű���
x212121_g_ScriptId = 212121

--��������NPC����
x212121_g_Position_X=154
x212121_g_Position_Z=205
x212121_g_SceneID=25
x212121_g_AccomplishNPC_Name="����"

--�����
x212121_g_MissionId = 932

--Ŀ��NPC
x212121_g_Name	="����"

--�������
x212121_g_MissionKind = 35

--����ȼ�
x212121_g_MissionLevel = 41

--�Ƿ��Ǿ�Ӣ����
x212121_g_IfMissionElite = 0

--������
x212121_g_MissionName="��Ѩ��Ӫ"
x212121_g_MissionInfo="#{Mis_30_60_desc_007}"
x212121_g_MissionTarget="    ��ɽ������#{_INFOAIM155,205,25,����}Ҫ��ȥ̽����Ѩ��Ӫ��"
x212121_g_MissionContinue="  ���Ѿ��������Ѩ��Ӫ��"
x212121_g_MissionComplete="  ������³���Ҫ��ȡ��һ�����ж��ˣ���ҲҪ�ú�׼��һ���ˡ�"

x212121_g_MoneyBonus=8500
x212121_g_exp=10000

x212121_g_Custom	= { {id="��̽����Ѩ��Ӫ",num=1} }
x212121_g_IsMissionOkFail = 0

--MisDescEnd

--**********************************
--������ں���
--**********************************
function x212121_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212121_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212121_g_MissionId) > 0)  then
			--x212121_OnContinue( sceneId, selfId, targetId )
			local bDone = x212121_CheckSubmit( sceneId, selfId )
			BeginEvent(sceneId)
				AddText(sceneId,x212121_g_MissionName)
				AddText(sceneId,x212121_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212121_g_ScriptId,x212121_g_MissionId,bDone)		
	
	--���������������
	elseif x212121_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		local  PlayerName=GetName(sceneId,selfId)	
		BeginEvent(sceneId)
			AddText(sceneId,x212121_g_MissionName)
			AddText(sceneId,x212121_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212121_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212121_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212121_g_ScriptId,x212121_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212121_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212121_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212121_g_MissionId) > 0 then
			AddNumText(sceneId, x212121_g_ScriptId,x212121_g_MissionName,2,-1);
	--���������������
	elseif x212121_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x212121_g_ScriptId,x212121_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x212121_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212121_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212121_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x212121_OnAccept( sceneId, selfId, targetId )
	if x212121_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- �����ҵ��ķ��ǲ��Ǵﵽ��Ҫ��ǰ�����ķ��ȼ����ڵ���20����
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 20 ) == 0  then  -- zchw
   	BeginEvent(sceneId)
			local strText = format("���������Ҫǰ�����ķ����ﵽ20����")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--������������б�
	local ret = AddMission(sceneId,selfId, x212121_g_MissionId, x212121_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#Y���������־�Ѿ�����")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y����������Ѩ��Ӫ")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212121_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	
	-- ��ҹ��Ľ�������
	SetMissionEvent( sceneId,selfId,x212121_g_MissionId, 1 )
	
end

--**********************************
--����
--**********************************
function x212121_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212121_g_MissionId )
end

--**********************************
--����
--**********************************
function x212121_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x212121_g_MissionName)
	AddText(sceneId,x212121_g_MissionComplete)
	AddMoneyBonus( sceneId, x212121_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212121_g_ScriptId,x212121_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212121_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212121_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212121_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212121_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212121_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x212121_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212121_g_exp)
		DelMission( sceneId, selfId, x212121_g_MissionId )
		MissionCom( sceneId, selfId, x212121_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y���������Ѩ��Ӫ",MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212121_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212121_OnEnterArea( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x212121_OnItemChanged( sceneId, selfId, itemdataId )
end

