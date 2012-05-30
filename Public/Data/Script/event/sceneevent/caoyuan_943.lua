--��ԭ ��ԭ�Ľٷ�
--212125

--MisDescBegin
--�ű���
x212125_g_ScriptId = 212125

--��������NPC����
x212125_g_Position_X=164
x212125_g_Position_Z=159
x212125_g_SceneID=20
x212125_g_AccomplishNPC_Name="��Ǿ"

--�����
x212125_g_MissionId = 943

--Ŀ��NPC
x212125_g_Name	="��Ǿ"

--�������
x212125_g_MissionKind = 31

--����ȼ�
x212125_g_MissionLevel = 59

--�Ƿ��Ǿ�Ӣ����
x212125_g_IfMissionElite = 0

--������
x212125_g_MissionName="��ԭ�Ľٷ�"
x212125_g_MissionInfo="#{Mis_30_60_desc_018}"
x212125_g_MissionTarget="    ��ԭ���꿤����Ǿ#{_INFOAIM163,158,20,��Ǿ}����ɱ��30���䵶���#{_INFOAIM273,156,20,-1}��"
x212125_g_MissionContinue="  ���Ѿ�ɱ��30���䵶�������"
x212125_g_MissionComplete="  û�������㻹���������ӡ�"

x212125_g_MoneyBonus=10000
x212125_g_exp=15000

x212125_g_Custom	= { {id="��ɱ���䵶���",num=30} }
x212125_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212125_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212125_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212125_g_MissionId) > 0)  then
		--x212125_OnContinue( sceneId, selfId, targetId )
		local bDone = x212125_CheckSubmit( sceneId, selfId )
		BeginEvent(sceneId)
			AddText(sceneId,x212125_g_MissionName)
			AddText(sceneId,x212125_g_MissionContinue)
		EndEvent( )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212125_g_ScriptId,x212125_g_MissionId,bDone)		
	
	--���������������
	elseif x212125_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		local  PlayerName=GetName(sceneId,selfId)	
		BeginEvent(sceneId)
			AddText(sceneId,x212125_g_MissionName)
			AddText(sceneId,x212125_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212125_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212125_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212125_g_ScriptId,x212125_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212125_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212125_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212125_g_MissionId) > 0 then
		AddNumText(sceneId, x212125_g_ScriptId,x212125_g_MissionName,2,-1);
	--���������������
	elseif x212125_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212125_g_ScriptId,x212125_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x212125_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212125_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212125_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x212125_OnAccept( sceneId, selfId, targetId )
	if x212125_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- �����ҵ��ķ��ǲ��Ǵﵽ��Ҫ��ǰ�����ķ��ȼ����ڵ���30����
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 30 ) == 0  then -- zchw
   	BeginEvent(sceneId)
			local strText = format("���������Ҫǰ�����ķ����ﵽ30����")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--������������б�
	local ret = AddMission(sceneId,selfId, x212125_g_MissionId, x212125_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		Msg2Player(sceneId, selfId,"#Y���������־�Ѿ����ˡ�" , MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, "#Y���������־�Ѿ����ˡ�")
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	Msg2Player(sceneId, selfId,"#Y�������񣺲�ԭ�Ľٷˡ�",MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, "#Y�������񣺲�ԭ�Ľٷˡ�")
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212125_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	
	-- ��ҹ���ɱ��
	SetMissionEvent( sceneId,selfId,x212125_g_MissionId, 0 )

end

--**********************************
--����
--**********************************
function x212125_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212125_g_MissionId )
end

--**********************************
--����
--**********************************
function x212125_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x212125_g_MissionName)
	AddText(sceneId,x212125_g_MissionComplete)
	AddMoneyBonus( sceneId, x212125_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212125_g_ScriptId,x212125_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212125_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212125_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212125_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212125_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212125_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x212125_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212125_g_exp)
		DelMission( sceneId, selfId, x212125_g_MissionId )
		MissionCom( sceneId, selfId, x212125_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y������񣺲�ԭ�Ľٷ�",MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212125_OnKillObject( sceneId, selfId, objdataId, objId )
	local monsterName = GetMonsterNamebyDataId(objdataId)
	if monsterName == "�䵶���"    then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			if IsHaveMission(sceneId, humanObjId, x212125_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x212125_g_MissionId)
				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					local ct = GetMissionParam(sceneId, humanObjId, misIndex, 1)
					if ct < 30    then
						SetMissionByIndex(sceneId, humanObjId, misIndex, 1, ct+1)
						-- ֪ͨ�ͻ���
			     	BeginEvent(sceneId)
							local strText = format("��ɱ���䵶���:%d/30", ct+1 )
							AddText(sceneId, strText)
					  EndEvent(sceneId)
				  	DispatchMissionTips(sceneId,humanObjId)
						if ct+1 >= 30  then
							SetMissionByIndex( sceneId, humanObjId, misIndex, 0, 1 )
						end
					end
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x212125_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212125_OnItemChanged( sceneId, selfId, itemdataId )
end

