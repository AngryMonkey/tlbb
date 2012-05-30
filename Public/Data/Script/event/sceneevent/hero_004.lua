-- 212131
-- ������˫

-- ֱ�ӽ������������

--MisDescBegin
--�ű���
x212131_g_ScriptId = 212131

--��������NPC����
x212131_g_Position_X=222
x212131_g_Position_Z=102
x212131_g_SceneID=2
x212131_g_AccomplishNPC_Name="����"

--�����
x212131_g_MissionId = 253
--ǰ�������
x212131_g_PreMissionId = 309

--Ŀ��NPC
x212131_g_Name	="����"

--�������
x212131_g_MissionKind = 55

--����ȼ�
x212131_g_MissionLevel = 75

--�Ƿ��Ǿ�Ӣ����
x212131_g_IfMissionElite = 0

--������
x212131_g_MissionName="������˫"
x212131_g_MissionInfo="#{Mis_Hero_songxin_01}"
x212131_g_MissionTarget="    �ڴ�����ҵ�����#{_INFOAIM222,103,2,����}��"
x212131_g_MissionComplete="  ��ļ�ʶ���������Ѿ���������������Ӣ�۵ĳƺ�ҲԽ��Խ���ˡ���"

x212131_g_MoneyBonus=50000
x212131_g_exp=700000

x212131_g_Custom	= { {id="���ҵ�����",num=1} }
x212131_g_IsMissionOkFail = 0

x212131_g_RadioItemBonus={{id=10512017 ,num=1},{id=10511007,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212131_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212131_g_MissionId) > 0 ) then
		return
	
	elseif( IsHaveMission(sceneId,selfId,x212131_g_MissionId) > 0)  then
		x212131_OnContinue( sceneId, selfId, targetId )
	
	--���������������
	elseif x212131_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212131_g_MissionName)
			AddText(sceneId,x212131_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212131_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x212131_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x212131_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212131_g_ScriptId,x212131_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212131_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212131_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212131_g_MissionId) > 0 then
		AddNumText(sceneId, x212131_g_ScriptId,x212131_g_MissionName,2,-1);

	--���������������
	elseif x212131_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212131_g_ScriptId,x212131_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x212131_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212131_g_MissionId) > 0 ) then
		return 0
	end

	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212131_g_MissionLevel then
		return 0
	end
	
	--���ǰ������
	if IsMissionHaveDone(sceneId, selfId, x212131_g_PreMissionId ) < 1   then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x212131_OnAccept( sceneId, selfId, targetId )
	if x212131_CheckAccept(sceneId, selfId) < 1   then
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
	local ret = AddMission(sceneId,selfId, x212131_g_MissionId, x212131_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#Y���������־�Ѿ����ˡ�")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y��������������˫��")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212131_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--����
--**********************************
function x212131_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212131_g_MissionId )
end

--**********************************
--����
--**********************************
function x212131_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
		AddText(sceneId,x212131_g_MissionName)
		AddText(sceneId,x212131_g_MissionComplete)
		AddMoneyBonus( sceneId, x212131_g_MoneyBonus )
		for i, item in x212131_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212131_g_ScriptId,x212131_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212131_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212131_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212131_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212131_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		--���������
		BeginAddItem(sceneId)
		for i, item in x212131_g_RadioItemBonus do
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
		
		AddMoney(sceneId,selfId, x212131_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212131_g_exp)
		DelMission( sceneId, selfId, x212131_g_MissionId )
		MissionCom( sceneId, selfId, x212131_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y�������������˫",MSG2PLAYER_PARA )
		
		-- �������ӳƺ�
		LuaFnAwardTitle( sceneId, selfId,  9, 233)
		SetCurTitle(sceneId, selfId,  9, 233)
		LuaFnDispatchAllTitle(sceneId, selfId)
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x212131_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212131_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212131_OnItemChanged( sceneId, selfId, itemdataId )
end

