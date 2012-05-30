-- 200051 һЦ�˼�����
-- ������ɽͯ����������ʵֻ�ǿ�Ϸ����������

--************************************************************************
--MisDescBegin
--�ű���
x200051_g_ScriptId = 200051

--�����
x200051_g_MissionId = 41

--ǰ�������
x200051_g_PreMissionId = 40

--Ŀ��NPC
x200051_g_Name = "����"

--�Ƿ��Ǿ�Ӣ����
x200051_g_IfMissionElite = 1

--����ȼ�
x200051_g_MissionLevel = 70

--�������
x200051_g_MissionKind = 49

--�����ı�����
x200051_g_MissionName="һЦ�˼�����"
x200051_g_MissionInfo="#{Mis_juqing_0041}"
x200051_g_MissionTarget="#{Mis_juqing_Tar_0041}"	--����Ŀ��
x200051_g_MissionComplete="  ���ǻ��ǿ���뿪����ɣ������ӷ�����������"

x200051_g_MoneyBonus=9000
x200051_g_exp=17280

x200051_g_RadioItemBonus={{id=10415013 ,num=1},{id=10415014,num=1},{id=10415015,num=1}}

x200051_g_Custom	= { {id="һЦ�˼�����",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200051_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200051_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200051_g_MissionId) > 0)  then
		-- ����ǲ����ڸ������ټ���ǲ��ǣ�����ǾͿ���ֱ�������^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --���������Ǹ���
			-- ��������֣���ȫ���
			if GetName(sceneId, targetId) == x200051_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200051_g_MissionName)
				AddText(sceneId,x200051_g_MissionComplete)
				AddMoneyBonus( sceneId, x200051_g_MoneyBonus )
		    EndEvent( )
				bDone = x200051_CheckSubmit( sceneId, selfId )
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x200051_g_ScriptId,x200051_g_MissionId,bDone)
		    --DispatchMissionContinueInfo(sceneId,selfId,targetId,x200051_g_ScriptId,x200051_g_MissionId)
			end
		end
	
	--���������������
	elseif x200051_CheckAccept(sceneId, selfId, targetId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200051_g_MissionName)
			AddText(sceneId,x200051_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200051_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200051_g_MoneyBonus )
			for i, item in x200051_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200051_g_ScriptId,x200051_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x200051_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200051_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200051_g_MissionId) > 0 then
		--��Ҫ�ڸ����ſ���
		if GetName(sceneId, targetId) == x200051_g_Name    then
			AddNumText(sceneId, x200051_g_ScriptId,x200051_g_MissionName,2,-1);
		end
		
	--���������������
	elseif x200051_CheckAccept(sceneId,selfId,targetId) > 0 then	
		AddNumText(sceneId,x200051_g_ScriptId,x200051_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200051_CheckAccept( sceneId, selfId, targetId )
	--�ж�����
	--1��ǰ���������
	if IsMissionHaveDone(sceneId,selfId,x200051_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200051_g_MissionId) > 0  then
		return 0
	end
	
	--2���ȼ��ﵽ50
	if GetLevel(sceneId, selfId) < 70   then
		return 0
	end

	--����ǲ�����ɽͯ��
	if GetName(sceneId, targetId) ~= "��ɽͯ��"    then
		return 0
	end
	
	return 1
end


--**********************************
--����
--**********************************
function x200051_OnAccept( sceneId, selfId, targetId )

	if x200051_CheckAccept(sceneId, selfId, targetId) ~= 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200051_g_MissionId, x200051_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"#Y��������һЦ�˼�����",MSG2PLAYER_PARA )

	-- ��������
	LuaFnSetCopySceneData_Param(sceneId, 8, 1)
	LuaFnSetCopySceneData_Param(sceneId, 10, 0)
	LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
end

--**********************************
--��ʱ�¼�
--**********************************
function x200051_OnTimer(sceneId,selfId)
	
	if 1==1  then 
		return
	end

	-- ���ü�ʱ�������ƾ���
	local misIndex = GetMissionIndexByID(sceneId, selfId, x200051_g_MissionId)--�õ�������20�������е����к�
	
	local bDone = GetMissionParam( sceneId,selfId,misIndex,0 )
	local NowTime = LuaFnGetCurrentTime()
	local OldTime = GetMissionParam( sceneId,selfId,misIndex,1 )

	local nSceneId = GetMissionParam( sceneId,selfId,misIndex,3 )
	if 	nSceneId ~= sceneId    then
		-- ����뿪������������ر�֮
		StopMissionTimer(sceneId,selfId,x200051_g_MissionId)
		return
	end
	
	if bDone == 1   then
		-- �رռ�ʱ��
		StopMissionTimer(sceneId, selfId, x200051_g_MissionId)
		return
	end
	
	-- ����ʱ�����NPC��Ϊ
	if NowTime - OldTime > 10   then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		BeginEvent(sceneId)
			AddText(sceneId,"�������1/1");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end

end

--**********************************
--����
--**********************************
function x200051_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200051_g_MissionId )
end

--**********************************
--����
--**********************************
function x200051_OnContinue( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,x200051_g_MissionName)
		AddText(sceneId,x200051_g_MissionComplete)
		AddMoneyBonus( sceneId, x200051_g_MoneyBonus )
		for i, item in x200051_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x200051_g_ScriptId,x200051_g_MissionId)
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200051_CheckSubmit( sceneId, selfId )
	
	--1, �Ƿ����������
	if IsHaveMission(sceneId,selfId,x200051_g_MissionId) < 1 then
		return 0;
	end
	
	--2, �Ƿ��Ѿ�����������
	if IsMissionHaveDone(sceneId,selfId,x200051_g_MissionId) > 0  then
		return 0;
	end
	
	--3���ȼ��ﵽ70
	if GetLevel(sceneId, selfId) < 70 then
		return 0;
	end

	--4�������ض�������
	local bDone = LuaFnGetCopySceneData_Param( sceneId, 15 )
	if bDone ~= 1 then
		return 0
	end

	return 1
	
end

--**********************************
--�ύ
--**********************************
function x200051_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--1�������ύ�������ж�
	if x200051_CheckSubmit( sceneId, selfId) == 1  then

		--2���Ƿ�������Ʒ
	  	BeginAddItem(sceneId)
			for i, item in x200051_g_RadioItemBonus do
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

		--3��ɾ������
		MissionCom( sceneId, selfId, x200051_g_MissionId )
		if DelMission( sceneId, selfId, x200051_g_MissionId ) ~= 1 then
			return
		end

		--4�����������
		AddItemListToHuman(sceneId,selfId)
		AddMoney(sceneId,selfId, x200051_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200051_g_exp)
		
		--5����ʾ
		Msg2Player( sceneId, selfId, "#Y�������һЦ�˼�����", MSG2PLAYER_PARA )

		--6�����ú�������
		CallScriptFunction((200052), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x200051_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200051_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200051_OnItemChanged( sceneId, selfId, itemdataId )
	
end


