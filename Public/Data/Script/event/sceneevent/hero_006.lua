-- 212133
-- �޵�����

-- ֱ�ӽ������������

--MisDescBegin
--�ű���
x212133_g_ScriptId = 212133

--��������NPC����
x212133_g_Position_X=267
x212133_g_Position_Z=116
x212133_g_SceneID=1
x212133_g_AccomplishNPC_Name="����ʯ"

--�����
x212133_g_MissionId = 255
--ǰ�������
x212133_g_PreMissionId = 389

--Ŀ��NPC
x212133_g_Name	="����ʯ"

--�������
x212133_g_MissionKind = 55

--����ȼ�
x212133_g_MissionLevel = 75

--�Ƿ��Ǿ�Ӣ����
x212133_g_IfMissionElite = 0

--������
x212133_g_MissionName="�޵�����"
x212133_g_MissionInfo="#{Mis_Hero_songxin_03}"
x212133_g_MissionTarget="    �����ݳ��ҵ�����ʯ#{_INFOAIM267,116,1,����ʯ}��"
x212133_g_MissionComplete="  ����书���������Ѿ���������������Ӣ�۵ĳƺ�ҲԽ��Խ���ˡ�"

x212133_g_MoneyBonus=50000
x212133_g_exp=700000

x212133_g_Custom	= { {id="���ҵ�����ʯ",num=1} }
x212133_g_IsMissionOkFail = 0

x212133_g_RadioItemBonus={{id=10520087 ,num=1},{id=10522067,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212133_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212133_g_MissionId) > 0 ) then
		return
	
	elseif( IsHaveMission(sceneId,selfId,x212133_g_MissionId) > 0)  then
		x212133_OnContinue( sceneId, selfId, targetId )
	
	--���������������
	elseif x212133_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212133_g_MissionName)
			AddText(sceneId,x212133_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212133_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x212133_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x212133_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212133_g_ScriptId,x212133_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212133_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212133_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212133_g_MissionId) > 0 then
		AddNumText(sceneId, x212133_g_ScriptId,x212133_g_MissionName,2,-1);

	--���������������
	elseif x212133_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212133_g_ScriptId,x212133_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x212133_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212133_g_MissionId) > 0 ) then
		return 0
	end

	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212133_g_MissionLevel then
		return 0
	end	
	
	--���ǰ������
	if IsMissionHaveDone(sceneId, selfId, x212133_g_PreMissionId ) < 1   then
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x212133_OnAccept( sceneId, selfId, targetId )
	if x212133_CheckAccept(sceneId, selfId) < 1   then
		return 0
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
	
	--������������б�
	local ret = AddMission(sceneId,selfId, x212133_g_MissionId, x212133_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#Y���������־�Ѿ����ˡ�")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y���������޵����͡�")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212133_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--����
--**********************************
function x212133_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212133_g_MissionId )
end

--**********************************
--����
--**********************************
function x212133_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
		AddText(sceneId,x212133_g_MissionName)
		AddText(sceneId,x212133_g_MissionComplete)
		AddMoneyBonus( sceneId, x212133_g_MoneyBonus )
		for i, item in x212133_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212133_g_ScriptId,x212133_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212133_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212133_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212133_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212133_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		--���������
		BeginAddItem(sceneId)
		for i, item in x212133_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		
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
		
		AddMoney(sceneId,selfId, x212133_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212133_g_exp)
		DelMission( sceneId, selfId, x212133_g_MissionId )
		MissionCom( sceneId, selfId, x212133_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y��������޵�����",MSG2PLAYER_PARA )

		-- �������ӳƺ�
		LuaFnAwardTitle( sceneId, selfId,  11, 235)
		SetCurTitle(sceneId, selfId,  11, 235)
		LuaFnDispatchAllTitle(sceneId, selfId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x212133_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212133_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212133_OnItemChanged( sceneId, selfId, itemdataId )
end

