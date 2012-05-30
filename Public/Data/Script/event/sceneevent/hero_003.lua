-- 212130
-- ����Ӣ��˭����

--MisDescBegin
--�ű���
x212130_g_ScriptId = 212130

--��������NPC����
x212130_g_Position_X=267
x212130_g_Position_Z=116
x212130_g_SceneID=1
x212130_g_AccomplishNPC_Name="����ʯ"

--�����
x212130_g_MissionId = 252

--Ŀ��NPC
x212130_g_Name	="����ʯ"

--�������
x212130_g_MissionKind = 55

--����ȼ�
x212130_g_MissionLevel = 75

--�Ƿ��Ǿ�Ӣ����
x212130_g_IfMissionElite = 0

--������
x212130_g_MissionName="����Ӣ��˭����"
x212130_g_MissionInfo="#{Mis_75_desc_003}"
x212130_g_MissionTarget="    �����ݳ��ҵ�����ʯ#{_INFOAIM267,116,1,����ʯ}��"
--x212130_g_MissionContinue="  ��������ܹ�����һ�Σ��һ���ôѡ���أ���Ȼ��ʵ������޴ӷֱ棬Ϊ�β�����������ٻ����������ء�"
x212130_g_MissionComplete="  ������ǿ�����հ�����ҵ����һ������Ը���������������������˵������ʧ�������ʲô�أ�"

x212130_g_MoneyBonus=5000
x212130_g_exp=50000

x212130_g_Custom	= { {id="���ҵ�����ʯ",num=1} }
x212130_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212130_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212130_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212130_g_Name then
			x212130_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x212130_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212130_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212130_g_MissionName)
				AddText(sceneId,x212130_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212130_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212130_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212130_g_ScriptId,x212130_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x212130_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212130_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212130_g_Name then
			AddNumText(sceneId, x212130_g_ScriptId,x212130_g_MissionName,2,-1);
		end
	--���������������
	elseif x212130_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212130_g_Name then
			AddNumText(sceneId,x212130_g_ScriptId,x212130_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x212130_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel(sceneId, selfId) < 10 then
		return 0
	end
	
	return 1
end

--**********************************
--����������
--**********************************
function x212130_CheckAcceptEx( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212130_g_MissionLevel then
		return 0
	end
	return 1
end


--**********************************
--����
--**********************************
function x212130_OnAccept( sceneId, selfId, targetId )
--PrintNum(1)
	if x212130_CheckAcceptEx(sceneId, selfId) < 1   then
		BeginEvent(sceneId)
			AddText( sceneId, "  ���������Ҫ�������ȼ���75����ǰ�����ķ��ȼ����ﵽ70�����ܽ�ȡ��" )
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return 
	end

	-- �����ҵ��ķ��ǲ��Ǵﵽ��Ҫ��ǰ�����ķ��ȼ����ڵ���30����
	
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 70 ) == 0  then
   	BeginEvent(sceneId)
			local strText = format("���������Ҫǰ�����ķ����ﵽ70����")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ��Ҫ��������϶�һ����Ʒ
	--������������б�
	local ret = AddMission(sceneId,selfId, x212130_g_MissionId, x212130_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#Y���������־�Ѿ����ˡ�")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y������������Ӣ��˭���֡�")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212130_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--����
--**********************************
function x212130_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212130_g_MissionId )
end

--**********************************
--����
--**********************************
function x212130_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x212130_g_MissionName)
	AddText(sceneId,x212130_g_MissionComplete)
	AddMoneyBonus( sceneId, x212130_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212130_g_ScriptId,x212130_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212130_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212130_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212130_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212130_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x212130_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212130_g_exp)
		DelMission( sceneId, selfId, x212130_g_MissionId )
		MissionCom( sceneId, selfId, x212130_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y�����������Ӣ��˭����",MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212130_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212130_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212130_OnItemChanged( sceneId, selfId, itemdataId )
end

