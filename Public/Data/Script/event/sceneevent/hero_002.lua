-- 212129
-- ����Ӣ�۽Լ�į

--MisDescBegin
--�ű���
x212129_g_ScriptId = 212129

--��������NPC����
x212129_g_Position_X=208
x212129_g_Position_Z=212
x212129_g_SceneID=0
x212129_g_AccomplishNPC_Name="˾���"

--�����
x212129_g_MissionId = 251

--Ŀ��NPC
x212129_g_Name	="˾���"

--�������
x212129_g_MissionKind = 55

--����ȼ�
x212129_g_MissionLevel = 75

--�Ƿ��Ǿ�Ӣ����
x212129_g_IfMissionElite = 0

--������
x212129_g_MissionName="����Ӣ�۽Լ�į"
x212129_g_MissionInfo="#{Mis_75_desc_002}"
x212129_g_MissionTarget="    ���������ҵ�˾���#{_INFOAIM207,212,0,˾���}��"
--x212129_g_MissionContinue="  ��������ܹ�����һ�Σ��һ���ôѡ���أ���Ȼ��ʵ������޴ӷֱ棬Ϊ�β�����������ٻ����������ء�"
x212129_g_MissionComplete="  ��ʷ�������ӣ����ι�����������Ϣ����Щ���˲�����Ӣ�ۣ�������ҵĺ��鶼����������ˮһȥ�����ˡ���"

x212129_g_MoneyBonus=5000
x212129_g_exp=50000

x212129_g_Custom	= { {id="���ҵ�˾���",num=1} }
x212129_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212129_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212129_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212129_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212129_g_Name then
			x212129_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x212129_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212129_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212129_g_MissionName)
				AddText(sceneId,x212129_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212129_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212129_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212129_g_ScriptId,x212129_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x212129_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212129_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212129_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212129_g_Name then
			AddNumText(sceneId, x212129_g_ScriptId,x212129_g_MissionName,2,-1);
		end
	--���������������
	elseif x212129_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212129_g_Name then
			AddNumText(sceneId,x212129_g_ScriptId,x212129_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x212129_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212129_g_MissionId) > 0 ) then
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
function x212129_CheckAcceptEx( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212129_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212129_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x212129_OnAccept( sceneId, selfId, targetId )
	if x212129_CheckAcceptEx(sceneId, selfId) < 1   then
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
	local ret = AddMission(sceneId,selfId, x212129_g_MissionId, x212129_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#Y���������־�Ѿ����ˡ�")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y�������񣺹���Ӣ�۽Լ�į��")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212129_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--����
--**********************************
function x212129_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212129_g_MissionId )
end

--**********************************
--����
--**********************************
function x212129_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x212129_g_MissionName)
	AddText(sceneId,x212129_g_MissionComplete)
	AddMoneyBonus( sceneId, x212129_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212129_g_ScriptId,x212129_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212129_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212129_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212129_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212129_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x212129_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212129_g_exp)
		DelMission( sceneId, selfId, x212129_g_MissionId )
		MissionCom( sceneId, selfId, x212129_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y������񣺹���Ӣ�۽Լ�į",MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212129_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212129_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212129_OnItemChanged( sceneId, selfId, itemdataId )
end

