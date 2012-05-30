-- �����е��Ƿ����Ÿ�����ˢ�������Ƿ�

--MisDescBegin
--�ű���
x200026_g_ScriptId = 200026

--�����
x200026_g_MissionId = 47

--ǰ������
x200026_g_PreMissionId = 21

--��������NPC����
x200026_g_Position_X=277
x200026_g_Position_Z=133
x200026_g_SceneID=0
x200026_g_AccomplishNPC_Name="�Ƿ�"

--Ŀ��NPC
x200026_g_Name	="�Ƿ�"

--�������
x200026_g_MissionKind = 47

--����ȼ�
x200026_g_MissionLevel = 40

--�Ƿ��Ǿ�Ӣ����
x200026_g_IfMissionElite = 0

--������
x200026_g_MissionName="�������"
x200026_g_MissionInfo="  $N����İ�������ĳ��ʤ�м���#r  ��ĳ����һ���Ҫ������������ׯ����Ѧ��ҽ�������ˡ�����ׯ����Щ��֪С�˶�����ĳ��ҥ������ǲ��ѣ�Ҫ�������ң�δ������ô���ס�#r  $N������һ�磬���������Ƕ����ټ���"
x200026_g_MissionTarget="  ��#G�����Ƕ���#W�����ҵ�#R�Ƿ�#W#{_INFOAIM275,134,0,�Ƿ�}��"
x200026_g_MissionComplete="  $N���������٣�����������Ⱥ��ʱ�ˡ�������ͳ���ȥ����ׯ�ɡ�"

x200026_g_MoneyBonus=5400
x200026_g_exp=5400

x200026_g_Custom	= { {id="���ҵ��Ƿ�",num=1} }
x200026_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x200026_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200026_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200026_g_MissionId) > 0)  then
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType ~= 1 then --���������Ǹ���
			x200026_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x200026_CheckAccept(sceneId,selfId) > 0 then
		-- �ж����ڸ�����
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --���������Ǹ���
		--if GetName(sceneId,targetId) ~= x200026_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x200026_g_MissionName)
				AddText(sceneId,x200026_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200026_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200026_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200026_g_ScriptId,x200026_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200026_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200026_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200026_g_MissionId) > 0 then
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType ~= 1 then --���������Ǹ���
			AddNumText(sceneId, x200026_g_ScriptId,x200026_g_MissionName,2,-1);
		end
	--���������������
	elseif x200026_CheckAccept(sceneId,selfId) > 0 then
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --���������Ǹ���
			AddNumText(sceneId,x200026_g_ScriptId,x200026_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x200026_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200026_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x200026_g_MissionLevel then
		return 0
	end
	
	-- ǰ�������������
	if IsMissionHaveDone(sceneId,selfId,x200026_g_PreMissionId) < 1  then
		return 0
	end
	return 1	
end

--**********************************
--����
--**********************************
function x200026_OnAccept( sceneId, selfId, targetId )
	if x200026_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200026_g_MissionId, x200026_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y�������񣺺������",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200026_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--����
--**********************************
function x200026_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200026_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200026_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200026_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x200026_g_MissionName)
	AddText(sceneId,x200026_g_MissionComplete)
	AddMoneyBonus( sceneId, x200026_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x200026_g_ScriptId,x200026_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200026_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200026_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200026_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200026_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x200026_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200026_g_exp)
		
		--���������Ѿ�����ɹ�
		DelMission( sceneId,selfId,  x200026_g_MissionId )
		MissionCom( sceneId,selfId,  x200026_g_MissionId )

		Msg2Player(  sceneId, selfId,"#Y������񣺺������",MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200022), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200026_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200026_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200026_OnItemChanged( sceneId, selfId, itemdataId )
end
