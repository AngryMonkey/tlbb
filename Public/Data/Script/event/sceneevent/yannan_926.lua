--���� ˽ͨ�ɹ�
--212120

--MisDescBegin
--�ű���
x212120_g_ScriptId = 212120

--��������NPC����
x212120_g_Position_X=129
x212120_g_Position_Z=50
x212120_g_SceneID=18
x212120_g_AccomplishNPC_Name="Ү��Ī��"

--�����
x212120_g_MissionId = 926

--Ŀ��NPC
x212120_g_Name	="Ү��Ī��"

--�������
x212120_g_MissionKind = 29

--����ȼ�
x212120_g_MissionLevel = 31

--�Ƿ��Ǿ�Ӣ����
x212120_g_IfMissionElite = 0

--������
x212120_g_MissionName="˽ͨ�ɹ�"
x212120_g_MissionInfo="#{Mis_30_60_desc_001}"
x212120_g_MissionTarget="    �����ٻ�ܺ��͸����ϵ�Ү��Ī��#{_INFOAIM128,50,18,Ү��Ī��}��"
x212120_g_MissionContinue="  ����˵���εĹ�Ա����̰�ƣ���֪���ǲ�����ġ�"
x212120_g_MissionComplete="  �������ٻ���ҵ��ţ����������ҿ������š����ţ�ԭ����������̫���ˣ���������˹�Ա���������ٶ���γ���ʿ��ս����ԡѪ��ս���������ˡ������������������Ǵ��ɹ���#r  <Ү��Ī������¶���˵����Ц�ݡ�>"

x212120_g_MoneyBonus=6000
x212120_g_exp=7000

x212120_g_Custom	= { {id="�ѵõ����ٻ�ܺ�",num=1} }
x212120_g_IsMissionOkFail = 0

x212120_g_MisItemId = 40004416 --���ٻ�ܺ�

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212120_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212120_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212120_g_Name then
			--x212120_OnContinue( sceneId, selfId, targetId )
			BeginEvent(sceneId)
				AddText(sceneId,x212120_g_MissionName)
				AddText(sceneId,x212120_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId,1)		
		end
	
	--���������������
	elseif x212120_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212120_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x212120_g_MissionName)
				AddText(sceneId,x212120_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212120_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212120_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x212120_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212120_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212120_g_Name then
			AddNumText(sceneId, x212120_g_ScriptId,x212120_g_MissionName,2,-1);
		end
	--���������������
	elseif x212120_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212120_g_Name then
			AddNumText(sceneId,x212120_g_ScriptId,x212120_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x212120_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212120_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x212120_OnAccept( sceneId, selfId, targetId )
	if x212120_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- �����ҵ��ķ��ǲ��Ǵﵽ��Ҫ��ǰ�����ķ��ȼ����ڵ���10����
	if x212120_CheckAllXinfaLevel(sceneId, selfId, 10) == 0  then --zchw
   	BeginEvent(sceneId)
			local strText = format("���������Ҫǰ�����ķ����ﵽ10����")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end

	-- ��Ҫ��������϶�һ����Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, x212120_g_MisItemId, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0  then
		--��ʾ���ܽ�������
		local strText = "Y������񱳰��Ѿ����ˡ���"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
		
	else
		--������������б�
		ret = AddMission(sceneId,selfId, x212120_g_MissionId, x212120_g_ScriptId, 0, 0, 0)
		if ret <= 0 then
			local strText = "#Y���������־�Ѿ����ˡ�"
			Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
	   	BeginEvent(sceneId)
				AddText(sceneId, strText)
		  EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
			return
		end
		local strText = "#Y��������˽ͨ�ɹ���"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212120_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		AddItemListToHuman(sceneId,selfId)
	end

end

--**********************************
--����
--**********************************
function x212120_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212120_g_MissionId )
	DelItem( sceneId, selfId, x212120_g_MisItemId, 1 )	
end

--**********************************
--����
--**********************************
function x212120_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
		AddText(sceneId,x212120_g_MissionName)
		AddText(sceneId,x212120_g_MissionComplete)
		AddMoneyBonus( sceneId, x212120_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212120_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212120_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212120_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212120_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- ɾ���������
		DelItem( sceneId, selfId, x212120_g_MisItemId, 1 )	
		--���������
		AddMoney(sceneId,selfId, x212120_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212120_g_exp)
		DelMission( sceneId, selfId, x212120_g_MissionId )
		MissionCom( sceneId, selfId, x212120_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y�������˽ͨ�ɹ�",MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212120_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212120_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212120_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����ķ��ǲ���������
--**********************************
function x212120_CheckAllXinfaLevel(sceneId, selfId, level)
	local nMenpai = GetMenPai(sceneId, selfId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMenpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	return 1
end
