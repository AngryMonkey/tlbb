-- ������ս 200043

-- ���������ŵ������⣬��ͬһ��NPC��

--************************************************************************
--MisDescBegin
--�ű���
x200043_g_ScriptId = 200043

--�����
x200043_g_MissionId = 36

--ǰ�������
x200043_g_PreMissionId = 35

--����Ŀ��NPC����
x200043_g_Position_X=125
x200043_g_Position_Z=144
x200043_g_SceneID=14
x200043_g_AccomplishNPC_Name="���Ǻ�"

--Ŀ��NPC
x200043_g_Name = "���Ǻ�"

--�Ƿ��Ǿ�Ӣ����
x200043_g_IfMissionElite = 1

--����ȼ�
x200043_g_MissionLevel = 60

--�������
x200043_g_MissionKind = 53

--�����ı�����
x200043_g_MissionName="������ս"
x200043_g_MissionInfo="#{Mis_juqing_0036}"
x200043_g_MissionTarget="#{Mis_juqing_Tar_0036}"	--����Ŀ��
x200043_g_MissionComplete="  ���������ˣ���ȥ׼��һ�°ɣ��붡������һս�������ޱȡ�"	--�������npc˵���Ļ�

x200043_g_MoneyBonus=8100
x200043_g_exp=20000

x200043_g_Custom	= { {id="���ҵ����Ǻ�",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200043_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200043_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200043_g_MissionId) > 0)  then
		-- ����ǲ����ڸ������ټ���ǲ��ǣ�����ǾͿ���ֱ�������^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType ~= 1 then --�������Ͳ��Ǹ���
			-- ��������֣���ȫ���
			if GetName(sceneId, targetId) == x200043_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200043_g_MissionName)
				AddText(sceneId,x200043_g_MissionComplete)
				AddMoneyBonus( sceneId, x200043_g_MoneyBonus )
		    EndEvent()
		    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200043_g_ScriptId,x200043_g_MissionId)
			end
		end
	
	--���������������
	elseif x200043_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200043_g_MissionName)
			AddText(sceneId,x200043_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200043_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200043_g_MoneyBonus )
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x200043_g_ScriptId,x200043_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x200043_OnEnumerate( sceneId, selfId, targetId )
	
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200043_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200043_g_MissionId) > 0 then
		--��Ҫ�ڸ����ſ���
		local sceneType = LuaFnGetSceneType(sceneId)
		if sceneType ~= 1 then --���������Ǹ���
			AddNumText(sceneId, x200043_g_ScriptId,x200043_g_MissionName,2,-1);
		end
		
	--���������������
	elseif x200043_CheckAccept(sceneId,selfId) > 0 then	
		AddNumText(sceneId,x200043_g_ScriptId,x200043_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200043_CheckAccept( sceneId, selfId )
	--�ж�����
	--1��ǰ���������
	if IsMissionHaveDone(sceneId,selfId,x200043_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200043_g_MissionId) > 0  then
		return 0
	end
	
	--2���ȼ��ﵽ60
	if GetLevel(sceneId, selfId) < 60   then
		return 0
	end

	--3���������Ǹ���
	local sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --���������Ǹ���
		return 1
	else 
		return 0
	end
	
	return 1
end


--**********************************
--����
--**********************************
function x200043_OnAccept( sceneId, selfId, targetId )

	if x200043_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200043_g_MissionId, x200043_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"#Y��������������ս",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200043_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)

end

--**********************************
--����
--**********************************
function x200043_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200043_g_MissionId )
end

--**********************************
--����
--**********************************
function x200043_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200043_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200043_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- �����ύ�������ж�
	-- 1�����������
	if( IsHaveMission(sceneId,selfId,x200043_g_MissionId) > 0)  then
		AddMoney(sceneId,selfId,x200043_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200043_g_exp)
		
		DelMission( sceneId,selfId,  x200043_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200043_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y�������������ս",MSG2PLAYER_PARA )

		-- ���ú�������
		CallScriptFunction((200045), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x200043_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200043_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200043_OnItemChanged( sceneId, selfId, itemdataId )
	
end



