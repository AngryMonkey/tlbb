--�㱱 ����ܻ�
--212122

--MisDescBegin
--�ű���
x212122_g_ScriptId = 212122

--��������NPC����
x212122_g_Position_X=234
x212122_g_Position_Z=192
x212122_g_SceneID=19
x212122_g_AccomplishNPC_Name="����"

--�����
x212122_g_MissionId = 935

--Ŀ��NPC
x212122_g_Name	="����"

--�������
x212122_g_MissionKind = 30

--����ȼ�
x212122_g_MissionLevel = 46

--�Ƿ��Ǿ�Ӣ����
x212122_g_IfMissionElite = 0

--������
x212122_g_MissionName="����ܻ�"
x212122_g_MissionInfo="#{Mis_30_60_desc_010}"
x212122_g_MissionTarget="    �㱱������#{_INFOAIM233,192,19,����}Ҫ��ȥɱ��20ֻ�����#{_INFOAIM233,93,19,-1}��"
x212122_g_MissionContinue="  ���Ѿ�ɱ��20ֻ�������ô��"
x212122_g_MissionComplete="  ����̫���ˣ�����һ������û�к�����ٸ���͵�Ծ����ˡ�"

x212122_g_MoneyBonus=10000
x212122_g_exp=12000

x212122_g_Custom	= { {id="��ɱ�������",num=20} }
x212122_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212122_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212122_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212122_g_MissionId) > 0)  then
		--x212122_OnContinue( sceneId, selfId, targetId )
		local bDone = x212122_CheckSubmit( sceneId, selfId )
		BeginEvent(sceneId)
			AddText(sceneId,x212122_g_MissionName)
			AddText(sceneId,x212122_g_MissionContinue)
		EndEvent( )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212122_g_ScriptId,x212122_g_MissionId,bDone)		
	
	--���������������
	elseif x212122_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		local  PlayerName=GetName(sceneId,selfId)	
		BeginEvent(sceneId)
			AddText(sceneId,x212122_g_MissionName)
			AddText(sceneId,x212122_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212122_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212122_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212122_g_ScriptId,x212122_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212122_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212122_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212122_g_MissionId) > 0 then
		AddNumText(sceneId, x212122_g_ScriptId,x212122_g_MissionName,2,-1);
	--���������������
	elseif x212122_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212122_g_ScriptId,x212122_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x212122_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212122_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212122_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x212122_OnAccept( sceneId, selfId, targetId )
	if x212122_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- �����ҵ��ķ��ǲ��Ǵﵽ��Ҫ��ǰ�����ķ��ȼ����ڵ���20����
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 20 ) == 0  then -- zchw
   	BeginEvent(sceneId)
			local strText = format("���������Ҫǰ�����ķ����ﵽ20����")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--������������б�
	local ret = AddMission(sceneId,selfId, x212122_g_MissionId, x212122_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		Msg2Player(sceneId, selfId,"#Y���������־�Ѿ����ˡ�" , MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, "#Y���������־�Ѿ����ˡ�")
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	Msg2Player(sceneId, selfId,"#Y������������ܻ���",MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, "#Y������������ܻ���")
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212122_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	
	-- ��ҹ���ɱ��
	SetMissionEvent( sceneId,selfId,x212122_g_MissionId, 0 )

end

--**********************************
--����
--**********************************
function x212122_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212122_g_MissionId )
end

--**********************************
--����
--**********************************
function x212122_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x212122_g_MissionName)
	AddText(sceneId,x212122_g_MissionComplete)
	AddMoneyBonus( sceneId, x212122_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212122_g_ScriptId,x212122_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212122_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212122_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212122_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212122_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212122_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x212122_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212122_g_exp)
		DelMission( sceneId, selfId, x212122_g_MissionId )
		MissionCom( sceneId, selfId, x212122_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y�����������ܻ�",MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212122_OnKillObject( sceneId, selfId, objdataId, objId )
	local monsterName = GetMonsterNamebyDataId(objdataId)
	if monsterName == "�����"    then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			if IsHaveMission(sceneId, humanObjId, x212122_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x212122_g_MissionId)
				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					local ct = GetMissionParam(sceneId, humanObjId, misIndex, 1)
					if ct < 20    then
						SetMissionByIndex(sceneId, humanObjId, misIndex, 1, ct+1)
						-- ֪ͨ�ͻ���
			     	BeginEvent(sceneId)
							local strText = format("��ɱ�������:%d/20", ct+1 )
							AddText(sceneId, strText)
					  EndEvent(sceneId)
				  	DispatchMissionTips(sceneId,humanObjId)
						if ct+1 >= 20  then
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
function x212122_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212122_OnItemChanged( sceneId, selfId, itemdataId )
end

