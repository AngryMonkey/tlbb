-- ��ʱ�������
-- ȥ��ãɽս��̽����̫�����ʡ�������Ӫ����ãɽ��ɽ������ãɽ��ɽ����

--MisDescBegin
--�ű���
x200031_g_ScriptId = 200031

--�����
x200031_g_MissionId = 27

x200031_g_Name=""

--ǰ������
x200031_g_PreMissionId = 26

--�������
x200031_g_MissionKind = 52

--����ȼ�
x200031_g_MissionLevel = 50

--�Ƿ��Ǿ�Ӣ����
x200031_g_IfMissionElite = 0

--������
x200031_g_MissionName="��ʱ�������"
x200031_g_MissionInfo="#{Mis_juqing_0027}"
x200031_g_MissionTarget="#{Mis_juqing_Tar_0027}"
x200031_g_MissionComplete="  �������һ�ֵĵ��飬���ǾͿ����ڴ��Ѿ��������ˡ�"
x200031_g_MissionContinue="  ���Ѿ�̽������̫�����ʡ�������Ӫ����ãɽ��ɽ������ãɽ��ɽ�����������"

x200031_g_MoneyBonus=16200
x200031_g_exp=19920

x200031_g_RadioItemBonus={{id=10414009 ,num=1},{id=10414010,num=1},{id=10414011,num=1},{id=10414012,num=1}}

x200031_g_Custom	= { {id="�Ѿ�̽��������Ӫ",num=1}, {id="�Ѿ�̽����̫������",num=1}, {id="�Ѿ�̽����ãɽ��ɽ��",num=1}, {id="�Ѿ�̽����ãɽ��ɽ��",num=1} }

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x200031_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200031_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200031_g_MissionId) > 0)  then
		--x200031_OnContinue( sceneId, selfId, targetId )
 		local done = x200031_CheckSubmit( sceneId, selfId )
 		
		BeginEvent(sceneId)
			AddText(sceneId,x200031_g_MissionName);
			AddText(sceneId,x200031_g_MissionContinue);
		EndEvent(sceneId)
 		
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200031_g_ScriptId,x200031_g_MissionId,done)

	--���������������
	elseif x200031_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x200031_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200031_g_MissionName)
				AddText(sceneId,x200031_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200031_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r") -- �㽫�õ�
				for i, item in x200031_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x200031_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200031_g_ScriptId,x200031_g_MissionId)
		--end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200031_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200031_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200031_g_MissionId) > 0 then
		AddNumText(sceneId, x200031_g_ScriptId,x200031_g_MissionName,2,-1);
	--���������������
	elseif x200031_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x200031_g_Name then
			AddNumText(sceneId,x200031_g_ScriptId,x200031_g_MissionName,1,-1);
		--end
	end
end

--**********************************
--����������
--**********************************
function x200031_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200031_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x200031_g_MissionLevel then
		return 0
	end
	
	-- ǰ�������������
	if IsMissionHaveDone(sceneId,selfId,x200031_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--����
--**********************************
function x200031_OnAccept( sceneId, selfId )
	if x200031_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200031_g_MissionId, x200031_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player( sceneId, selfId,"#Y����������ʱ�������",MSG2PLAYER_PARA )
	
	-- ֪ͨ��ϵ��������
	-- 0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
	SetMissionEvent(sceneId, selfId, x200031_g_MissionId, 1)
	
	-- ʹ�������ǰ4λ����¼̽����4������
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200031_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)
	
end

--**********************************
--����
--**********************************
function x200031_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200031_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200031_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200031_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200031_g_MissionName)
		AddText(sceneId,x200031_g_MissionComplete)
		AddMoneyBonus( sceneId, x200031_g_MoneyBonus )
		for i, item in x200031_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200031_g_ScriptId,x200031_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200031_CheckSubmit( sceneId, selfId )

	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200031_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	-- ��ѯ4��ֵ�ǲ��Ƕ�ֵΪ1��
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200031_g_MissionId)			--�õ���������к�
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1 then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 1) < 1 then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 2) < 1 then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 3) < 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200031_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200031_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		-- 
  	BeginAddItem(sceneId)
		for i, item in x200031_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
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

		--���������
		AddMoney(sceneId,selfId, x200031_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200031_g_exp)

		DelMission( sceneId,selfId,  x200031_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200031_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y���������ʱ�������",MSG2PLAYER_PARA )
		
		-- ���þ��鲽��1
		LuaFnSetCopySceneData_Param(sceneId, 8, 1)
		LuaFnSetCopySceneData_Param(sceneId, 10, 0)
		LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
	end
end

--**********************************
--��ʱ�¼�
--**********************************
function x200031_OnTimer(sceneId,selfId)
end

--**********************************
--ɱ����������
--**********************************
function x200031_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200031_OnEnterArea( sceneId, selfId, zoneId )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200031_g_MissionId)			--�õ���������к�
	
	if zoneId == 0 and
		 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "�Ѿ�̽��������Ӫ��1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		
	elseif zoneId == 1 and
	 	 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 1) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "�Ѿ�̽����̫�����ʣ�1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,1,1)
		end
		
	elseif zoneId == 2 and
		 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 2) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "�Ѿ�̽����ãɽ��ɽ����1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,2,1)
		end
		
	elseif zoneId == 3 and
		 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 3) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "�Ѿ�̽����ãɽ��ɽ����1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,3,1)
		end
		
	end

end

--**********************************
--���߸ı�
--**********************************
function x200031_OnItemChanged( sceneId, selfId, itemdataId )
end
