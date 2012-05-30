--���� ����֮��
--212123

--MisDescBegin
--�ű���
x212123_g_ScriptId = 212123

--��������NPC����
x212123_g_Position_X=195
x212123_g_Position_Z=53
x212123_g_SceneID=32
x212123_g_AccomplishNPC_Name="����"

--�����
x212123_g_MissionId = 938

--Ŀ��NPC
x212123_g_Name	="����"

--�������
x212123_g_MissionKind = 43

--����ȼ�
x212123_g_MissionLevel = 52

--�Ƿ��Ǿ�Ӣ����
x212123_g_IfMissionElite = 0

--������
x212123_g_MissionName="����֮��"
x212123_g_MissionInfo="#{Mis_30_60_desc_013}"
x212123_g_MissionTarget="    �����˵��ź��͸�����ɽѲ����Ӫ�ص�����#{_INFOAIM194,52,32,����}��"
x212123_g_MissionContinue="  �Һ�Ȼ�������㱱�Ĵ�硭��"
x212123_g_MissionComplete="  ԭ���Ǵ���������ż����ֱ���ô�ã��ѵô�绹�������ң�"

x212123_g_MoneyBonus=12000
x212123_g_exp=15000

x212123_g_Custom	= { {id="�ѵõ����˵��ź�",num=1} }
x212123_g_IsMissionOkFail = 0

x212123_g_MisItemId = 40004420 --���˵��ź�

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212123_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212123_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212123_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212123_g_Name then
			--x212123_OnContinue( sceneId, selfId, targetId )
			BeginEvent(sceneId)
				AddText(sceneId,x212123_g_MissionName)
				AddText(sceneId,x212123_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212123_g_ScriptId,x212123_g_MissionId,1)		
			
		end
	
	--���������������
	elseif x212123_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212123_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212123_g_MissionName)
				AddText(sceneId,x212123_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212123_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212123_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212123_g_ScriptId,x212123_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x212123_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212123_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212123_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212123_g_Name then
			AddNumText(sceneId, x212123_g_ScriptId,x212123_g_MissionName,2,-1);
		end
	--���������������
	elseif x212123_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212123_g_Name then
			AddNumText(sceneId,x212123_g_ScriptId,x212123_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x212123_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212123_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212123_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x212123_OnAccept( sceneId, selfId, targetId )
	if x212123_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- �����ҵ��ķ��ǲ��Ǵﵽ��Ҫ��ǰ�����ķ��ȼ����ڵ���25����
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 25 ) == 0  then -- zchw
   	BeginEvent(sceneId)
			local strText = format("���������Ҫǰ�����ķ����ﵽ25����")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end

	-- ��Ҫ��������϶�һ����Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, x212123_g_MisItemId, 1 )
	local ret = EndAddItem( sceneId, selfId )
	
	if ret > 0  then
		--������������б�
		ret = AddMission(sceneId,selfId, x212123_g_MissionId, x212123_g_ScriptId, 0, 0, 0)
		if ret <= 0 then
			Msg2Player(sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA)
	   	BeginEvent(sceneId)
				AddText(sceneId, "#Y���������־�Ѿ�����")
		  EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
			return
		end
		Msg2Player(sceneId, selfId,"#Y������������֮��",MSG2PLAYER_PARA)
	 	BeginEvent(sceneId)
			AddText(sceneId, "#Y������������֮��")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212123_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		AddItemListToHuman(sceneId,selfId)
	else
		--��ʾ���ܽ�������
		local strText = "Y������񱳰��Ѿ����ˡ���"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
	end
	
end

--**********************************
--����
--**********************************
function x212123_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212123_g_MissionId )
	DelItem( sceneId, selfId, x212123_g_MisItemId, 1 )	
end

--**********************************
--����
--**********************************
function x212123_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x212123_g_MissionName)
	AddText(sceneId,x212123_g_MissionComplete)
	AddMoneyBonus( sceneId, x212123_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212123_g_ScriptId,x212123_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212123_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212123_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212123_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212123_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		DelItem( sceneId, selfId, x212123_g_MisItemId, 1 )	
		AddMoney(sceneId,selfId, x212123_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212123_g_exp)
		DelMission( sceneId, selfId, x212123_g_MissionId )
		MissionCom( sceneId, selfId, x212123_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y�����������֮��",MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212123_OnKillObject( sceneId, selfId, objdataId )
	
end

--**********************************
--���������¼�
--**********************************
function x212123_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x212123_OnItemChanged( sceneId, selfId, itemdataId )
	
end

