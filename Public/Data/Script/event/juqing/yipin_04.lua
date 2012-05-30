-- 200053 �ư��ʾ�����
-- ������ˮȥ������Ϣ֪ͨ�����ǵĺ���������

--************************************************************************
--MisDescBegin
--�ű���
x200053_g_ScriptId = 200053

--�����
x200053_g_MissionId = 43

--ǰ�������
x200053_g_PreMissionId = 42

--Ŀ��NPC
x200053_g_Name = "����"

--�Ƿ��Ǿ�Ӣ����
x200053_g_IfMissionElite = 1

--����ȼ�
x200053_g_MissionLevel = 70

--�������
x200053_g_MissionKind = 49

--�����ı�����
x200053_g_MissionName="�ư��ʾ�����"
x200053_g_MissionInfo="#{Mis_juqing_0043}"
x200053_g_MissionTarget="#{Mis_juqing_Tar_0043}"	--����Ŀ��
x200053_g_MissionComplete="  �㲻��$N�����ǹ���Ҳ�����������أ�����������������"

x200053_g_MoneyBonus=48600
x200053_g_exp=86400

x200053_g_RadioItemBonus={{id=10414017 ,num=1},{id=10414018,num=1},{id=10414019,num=1}}

x200053_g_Custom	= { {id="���ҵ�����",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200053_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200053_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200053_g_MissionId) > 0)  then
		-- ����ǲ����ڸ������ټ���ǲ��ǣ�����ǾͿ���ֱ�������^_^
			-- ��������֣���ȫ���
		if GetName(sceneId, targetId) == x200053_g_Name  then
	    BeginEvent(sceneId)
				AddText(sceneId,x200053_g_MissionName)
				AddText(sceneId,x200053_g_MissionComplete)
				AddMoneyBonus( sceneId, x200053_g_MoneyBonus )
				for i, item in x200053_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
	    EndEvent( )
			DispatchMissionContinueInfo(sceneId,selfId,targetId,x200053_g_ScriptId,x200053_g_MissionId)
		end
	
	--���������������
	elseif x200053_CheckAccept(sceneId, selfId, targetId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200053_g_MissionName)
			AddText(sceneId,x200053_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200053_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200053_g_MoneyBonus )
			for i, item in x200053_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200053_g_ScriptId,x200053_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x200053_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200053_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200053_g_MissionId) > 0 then
		--��Ҫ�ڸ����ſ���
		if GetName(sceneId, targetId) == x200053_g_Name    then
			AddNumText(sceneId, x200053_g_ScriptId,x200053_g_MissionName,2,-1);
		end
		
	--���������������
	elseif x200053_CheckAccept(sceneId,selfId,targetId) > 0 then	
		if GetName(sceneId, targetId) == "��������"    then
			AddNumText(sceneId,x200053_g_ScriptId,x200053_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x200053_CheckAccept( sceneId, selfId, targetId )

	--�ж�����
	--1��ǰ���������
	if IsMissionHaveDone(sceneId,selfId,x200053_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200053_g_MissionId) > 0  then
		return 0
	end
	
	--2���ȼ��ﵽ50
	if GetLevel(sceneId, selfId) < 70   then
		return 0
	end
	
	return 1
end


--**********************************
--����
--**********************************
function x200053_OnAccept( sceneId, selfId, targetId )

	if x200053_CheckAccept(sceneId, selfId, targetId) ~= 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200053_g_MissionId, x200053_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"#Y�������񣺾ư��ʾ�����",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200053_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)

end

--**********************************
--��ʱ�¼�
--**********************************
function x200053_OnTimer(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x200053_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200053_g_MissionId )
end

--**********************************
--����
--**********************************
function x200053_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200053_CheckSubmit( sceneId, selfId, selectRadioId )

	--1, �Ƿ����������
	if IsHaveMission(sceneId,selfId,x200053_g_MissionId) < 1 then
		return 0;
	end
	
	--2, �Ƿ��Ѿ�����������
	if IsMissionHaveDone(sceneId,selfId,x200053_g_MissionId) > 0  then
		return 0;
	end
	
	--3���ȼ��ﵽ70
	if GetLevel(sceneId, selfId) < 70   then
		return 0;
	end

	--4��������ɱ��
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200053_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, 0) ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200053_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--1, ��ǰ����Ƿ�����ȷ��NPC�Ի�
	if GetName(sceneId, targetId) ~= x200053_g_Name  then
		return
	end

	--2, �����ύ�������ж�
	if x200053_CheckSubmit( sceneId, selfId, selectRadioId ) ~= 1 then
		return
	end

	--3���Ƿ�������Ʒ
  	BeginAddItem(sceneId)
		for i, item in x200053_g_RadioItemBonus do
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

	--4��ɾ������
	MissionCom( sceneId, selfId, x200053_g_MissionId )
	if DelMission( sceneId, selfId, x200053_g_MissionId ) ~= 1 then
		return
	end

	--5�����������
	AddItemListToHuman(sceneId,selfId)
	AddMoney(sceneId,selfId, x200053_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId, x200053_g_exp)

	--6����ʾ
	Msg2Player( sceneId, selfId, "#Y������񣺾ư��ʾ�����", MSG2PLAYER_PARA )

	--7������
	LuaFnSetCopySceneData_Param(sceneId, 8, 1)
	LuaFnSetCopySceneData_Param(sceneId, 10, 0)
	LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
	LuaFnSetCopySceneData_Param(sceneId, 30, 1)

end

--**********************************
--ɱ����������
--**********************************
function x200053_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200053_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200053_OnItemChanged( sceneId, selfId, itemdataId )
	
end


