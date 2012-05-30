-- 200035 �������

--Ү�ɺ�� ����Һ� �Ի��� ����������ʱ�򣬻��о��飨�Ի����飩
--�˳���  �ز�ãɽ��Ү�ɺ������Ү����õ���ս�ƻ���������

--************************************************************************
--MisDescBegin
--�ű���
x200035_g_ScriptId = 200035

--�����
x200035_g_MissionId = 30

--ǰ�������
x200035_g_PreMissionId = 29

--Ŀ��NPC
x200035_g_Name = "����"

--�Ƿ��Ǿ�Ӣ����
x200035_g_IfMissionElite = 1

--����ȼ�
x200035_g_MissionLevel = 50

--�������
x200035_g_MissionKind = 52

--�����ı�����
x200035_g_MissionName="�������"
x200035_g_MissionInfo="#{Mis_juqing_0030}"
x200035_g_MissionTarget="#{Mis_juqing_Tar_0030}"	--����Ŀ��
x200035_g_MissionComplete="  �뿪�������ܣ����ǲ����ߵģ��Һ�����������֮ʱ���������ģ��и�ͬ������ͬ��������Σ����ͷ�����벻�ˣ��������Ǿ��Բ������ġ�"	--�������npc˵���Ļ�

x200035_g_MoneyBonus=1800
x200035_g_exp=1440

x200035_g_Custom	= { {id="���ҵ�����",num=1} }
--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200035_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200035_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200035_g_MissionId) > 0)  then
		-- ����ǲ����ڸ������ټ���ǲ��ǣ�����ǾͿ���ֱ�������^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --���������Ǹ���
			-- ��������֣���ȫ���
			if GetName(sceneId, targetId) == x200035_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200035_g_MissionName)
				AddText(sceneId,x200035_g_MissionComplete)
				AddMoneyBonus( sceneId, x200035_g_MoneyBonus )
		    EndEvent( )
		    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200035_g_ScriptId,x200035_g_MissionId)
			end
		end
	
	--���������������
	elseif x200035_CheckAccept(sceneId, selfId, targetId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x200035_g_MissionName)
		AddText(sceneId,x200035_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200035_g_MissionTarget)
		AddText(sceneId,"#{M_SHOUHUO}#r")
		AddMoneyBonus( sceneId, x200035_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200035_g_ScriptId,x200035_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x200035_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200035_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200035_g_MissionId) > 0 then
		--��Ҫ�ڸ����ſ���
		if GetName(sceneId, targetId) == x200035_g_Name    then
			AddNumText(sceneId, x200035_g_ScriptId,x200035_g_MissionName,2,-1);
		end
		
	--���������������
	elseif x200035_CheckAccept(sceneId,selfId,targetId) > 0 then	
		AddNumText(sceneId,x200035_g_ScriptId,x200035_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200035_CheckAccept( sceneId, selfId, targetId )
	--�ж�����
	--1��ǰ���������
	if IsMissionHaveDone(sceneId,selfId,x200035_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200035_g_MissionId) > 0  then
		return 0
	end
	
	--2���ȼ��ﵽ50
	if GetLevel(sceneId, selfId) < x200035_g_MissionLevel   then
		return 0
	end
	
	--����ǲ��ǻʵ�
	if GetName(sceneId, targetId) ~= "Ү�ɺ��"    then
		return 0
	end
	
	return 1
end


--**********************************
--����
--**********************************
function x200035_OnAccept( sceneId, selfId, targetId )

	if x200035_CheckAccept(sceneId, selfId, targetId) ~= 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200035_g_MissionId, x200035_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y���������������",MSG2PLAYER_PARA )

	-- �����к����ľ��飬��Ҫ���
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200035_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)

end

--**********************************
--����
--**********************************
function x200035_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200035_g_MissionId )
end

--**********************************
--����
--**********************************
function x200035_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200035_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200035_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- �����ύ�������ж�
	-- 1�����������
	if( IsHaveMission(sceneId,selfId,x200035_g_MissionId) > 0)  then
		AddMoney(sceneId,selfId,x200035_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200035_g_exp)
		DelMission( sceneId,selfId,  x200035_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200035_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y��������������",MSG2PLAYER_PARA )
		
		-- ��һ�ξ��飬���������󣬰���·���ߡ�
		if LuaFnGetCopySceneData_Param(sceneId, 8) < 1  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 1)
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		end
		
	end
end

--**********************************
--��ʱ�¼�
--**********************************
function x200035_OnTimer(sceneId,selfId)

end

--**********************************
--ɱ����������
--**********************************
function x200035_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200035_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200035_OnItemChanged( sceneId, selfId, itemdataId )
	
end

